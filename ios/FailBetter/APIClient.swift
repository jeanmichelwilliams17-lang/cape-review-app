// APIClient.swift — Network layer for the CAPE Review App
//
// The bearer token and Worker URL are stored in UserDefaults (accessible
// via @AppStorage in SwiftUI). Before shipping, move the token to the
// iOS Keychain using Security.framework or a wrapper like KeychainAccess.

import Foundation

// MARK: - API Errors

enum APIError: LocalizedError {
    case notConfigured
    case httpError(Int, String)
    case decodingError(Error)

    var errorDescription: String? {
        switch self {
        case .notConfigured:
            return "Worker URL or API token not set. Go to Settings."
        case .httpError(let code, let body):
            return "HTTP \(code): \(body)"
        case .decodingError(let err):
            return "Decoding error: \(err.localizedDescription)"
        }
    }
}

// MARK: - APIClient

final class APIClient {

    static let shared = APIClient()
    private init() {}

    // ── Config (read from UserDefaults / @AppStorage) ─────────────────────
    private var workerURL: URL? {
        guard let raw = UserDefaults.standard.string(forKey: "workerURL"),
              !raw.isEmpty,
              let url = URL(string: raw) else { return nil }
        return url
    }

    private var apiToken: String? {
        UserDefaults.standard.string(forKey: "apiToken")
    }

    // ── Base request builder ─────────────────────────────────────────────
    private func request(path: String, method: String = "GET", body: Data? = nil) throws -> URLRequest {
        guard let base = workerURL, let token = apiToken, !token.isEmpty else {
            throw APIError.notConfigured
        }
        let url = base.appendingPathComponent(path)
        var req = URLRequest(url: url, timeoutInterval: 30)
        req.httpMethod = method
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        if let body {
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpBody = body
        }
        return req
    }

    private func requestWithParams(path: String, params: [String: String]) throws -> URLRequest {
        guard let base = workerURL, let token = apiToken, !token.isEmpty else {
            throw APIError.notConfigured
        }
        var comps = URLComponents(url: base.appendingPathComponent(path),
                                  resolvingAgainstBaseURL: false)!
        comps.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        var req = URLRequest(url: comps.url!, timeoutInterval: 30)
        req.httpMethod = "GET"
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return req
    }

    // ── Generic execute + decode ─────────────────────────────────────────
    private func execute<T: Decodable>(_ req: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: req)
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? ""
            throw APIError.httpError(http.statusCode, body)
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }

    // ── Image URL (for AsyncImage / DiagramView fallback) ────────────────
    func imageURL(forDiagramKey key: String) -> URL? {
        guard let workerURL else { return nil }
        let safeKey = key.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? key
        return workerURL.appendingPathComponent("images").appendingPathComponent(safeKey)
    }

    // MARK: - Public API

    /// Fetch all subjects with P1/P2 question counts.
    func fetchSubjects() async throws -> [Subject] {
        let req = try request(path: "subjects")
        return try await execute(req)
    }

    /// Download the full `diagram_key → direct ImageKit URL` mapping from the worker.
    /// Used by DiagramPathCache to populate its on-device lookup table.
    func fetchDiagramPaths() async throws -> [String: String] {
        let req = try request(path: "diagram-paths")
        return try await execute(req)
    }

    /// Fetch a paginated list of questions with optional filters.
    /// - Parameters:
    ///   - paper: 1 or 2
    ///   - subject: subject name (e.g. "AccountingU1"), or nil for all
    ///   - reviewer: reviewer name; combined with reviewStatus=unreviewed gives personal queue
    ///   - reviewStatus: "unreviewed" | "correct" | "needs_fix" | nil
    ///   - cursor: pagination offset
    ///   - limit: page size (default 50)
    func fetchQuestions(
        paper: Int? = nil,
        subject: String? = nil,
        year: Int? = nil,
        reviewer: String? = nil,
        reviewStatus: String? = "unreviewed",
        cursor: Int = 0,
        limit: Int = 50
    ) async throws -> [Question] {
        var params: [String: String] = [
            "cursor": String(cursor),
            "limit":  String(limit),
        ]
        if let paper    { params["paper"]         = String(paper) }
        if let subject  { params["subject"]       = subject }
        if let year     { params["year"]          = String(year) }
        if let reviewer { params["reviewer"]      = reviewer }
        if let status   = reviewStatus { params["review_status"] = status }

        let req = try requestWithParams(path: "questions", params: params)
        return try await execute(req)
    }

    /// Fetch a single question with full detail (choices + review history).
    func fetchQuestion(id: Int) async throws -> Question {
        let req = try request(path: "questions/\(id)")
        return try await execute(req)
    }

    /// Submit a review for a question.
    func submitReview(
        questionID: Int,
        reviewer: String,
        status: String,   // "correct" | "needs_fix"
        note: String?
    ) async throws {
        struct Body: Encodable {
            let reviewer: String
            let status:   String
            let note:     String?
        }
        let body = try JSONEncoder().encode(Body(reviewer: reviewer, status: status, note: note))
        let req  = try request(path: "questions/\(questionID)/review", method: "POST", body: body)
        let _: [String: Bool] = try await execute(req) // { ok: true }
    }

    /// Delete a reviewer's review for a question.
    func deleteReview(questionID: Int, reviewer: String) async throws {
        struct Body: Encodable { let reviewer: String }
        let body = try JSONEncoder().encode(Body(reviewer: reviewer))
        let req  = try request(path: "questions/\(questionID)/review", method: "DELETE", body: body)
        let _: [String: Bool] = try await execute(req)
    }

    /// Fetch per-subject/paper review statistics.
    func fetchStats() async throws -> [SubjectStats] {
        let req = try request(path: "stats")
        return try await execute(req)
    }

    /// Fetch all known reviewer names.
    func fetchReviewers() async throws -> [String] {
        struct ReviewerRow: Decodable { let name: String }
        let req: URLRequest = try request(path: "reviewers")
        let rows: [ReviewerRow] = try await execute(req)
        return rows.map(\.name)
    }
}

// MARK: - DiagramPathCache

/// On-device cache of diagram_key → direct ImageKit URL
/// Downloading this map once per session (max refresh every 24 hours) lets DiagramView
/// construct direct ImageKit CDN URLs, bypassing the Cloudflare Worker proxy entirely.
@MainActor
final class DiagramPathCache {

    static let shared = DiagramPathCache()
    private init() { loadFromDisk() }

    // ── In-memory lookup table ────────────────────────────────────────────────
    private var paths: [String: String] = [:]
    private(set) var isLoaded: Bool = false

    // ── Disk persistence ──────────────────────────────────────────────────────
    private var cacheFileURL: URL {
        let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        return caches.appendingPathComponent("diagram_paths.json")
    }

    private let lastFetchKey = "DiagramPathCache.lastFetchDate"
    private let refreshInterval: TimeInterval = 24 * 60 * 60  // 24 hours

    // ── Public API ────────────────────────────────────────────────────────────

    /// Returns true if the key is known to have a resolved diagram image or has not been checked yet.
    func hasDiagram(for key: String) -> Bool {
        guard let path = paths[key] else { return true }
        return !path.isEmpty
    }

    /// Resolves the URL for a diagram key:
    /// - If direct ImageKit URL is cached locally → returns direct ImageKit CDN URL.
    /// - Otherwise → falls back to the worker proxy URL (which handles lookup & edge caching).
    func resolvedURL(for key: String) -> URL? {
        if let urlString = paths[key], !urlString.isEmpty, let url = URL(string: urlString) {
            return url
        }
        // Fallback to Worker proxy URL whenever local direct URL isn't resolved yet
        return APIClient.shared.imageURL(forDiagramKey: key)
    }

    /// Refresh the on-device cache from the worker.
    /// Skips the network call if the cache was fetched less than 24 hours ago,
    /// unless `force` is true.
    func refresh(force: Bool = false) {
        let lastFetch = UserDefaults.standard.double(forKey: lastFetchKey)
        let elapsed   = Date().timeIntervalSince1970 - lastFetch
        guard force || elapsed > refreshInterval || paths.isEmpty else { return }

        Task {
            do {
                let fresh = try await APIClient.shared.fetchDiagramPaths()
                paths = fresh
                isLoaded = true
                saveToDisk(fresh)
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: lastFetchKey)
            } catch {
                // Non-fatal: stale on-disk cache will continue serving existing hits.
                print("[DiagramPathCache] refresh failed: \(error.localizedDescription)")
            }
        }
    }

    // ── Private helpers ───────────────────────────────────────────────────────

    private func loadFromDisk() {
        guard let data = try? Data(contentsOf: cacheFileURL),
              let decoded = try? JSONDecoder().decode([String: String].self, from: data)
        else { return }
        paths = decoded
        isLoaded = true
    }

    private func saveToDisk(_ map: [String: String]) {
        guard let data = try? JSONEncoder().encode(map) else { return }
        try? data.write(to: cacheFileURL, options: .atomic)
    }
}
