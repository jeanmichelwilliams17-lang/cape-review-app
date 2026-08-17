// DiagramPathCache.swift — On-device cache of diagram_key → direct ImageKit URL
//
// Downloading this map once per session (max refresh every 24 hours) lets DiagramView
// construct direct ImageKit CDN URLs, bypassing the Cloudflare Worker proxy entirely.
//
// Hit path:  iOS → ImageKit CDN                         (~80–200 ms)
// Miss path: iOS → Worker → ImageKit CDN → Worker → iOS (~300–800 ms)

import Foundation

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

    /// Returns true if the key is known to have a resolved diagram image in the database.
    func hasDiagram(for key: String) -> Bool {
        guard let path = paths[key] else { return false }
        return !path.isEmpty
    }

    /// Resolves the URL for a diagram key:
    /// - If resolved in local cache → returns direct ImageKit CDN URL.
    /// - If explicitly unresolved ("") or key missing after DB map loaded → returns nil (no image exists, avoid network call).
    /// - If cache hasn't loaded yet → falls back to worker proxy URL.
    func resolvedURL(for key: String) -> URL? {
        if let urlString = paths[key] {
            if urlString.isEmpty {
                return nil // Explicitly unresolved on ImageKit → skip network fetch
            }
            return URL(string: urlString)
        }
        if isLoaded {
            return nil // Key is not in database → skip network fetch
        }
        // Fallback while cache is still loading for the first time
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
