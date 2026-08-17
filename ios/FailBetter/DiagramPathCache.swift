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

    // ── Disk persistence ──────────────────────────────────────────────────────
    private var cacheFileURL: URL {
        let caches = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        return caches.appendingPathComponent("diagram_paths.json")
    }

    private let lastFetchKey = "DiagramPathCache.lastFetchDate"
    private let refreshInterval: TimeInterval = 24 * 60 * 60  // 24 hours

    // ── Public API ────────────────────────────────────────────────────────────

    /// Returns true if the key is known to be a valid diagram key in the database.
    func hasDiagram(for key: String) -> Bool {
        return paths.keys.contains(key)
    }

    /// Returns a direct ImageKit CDN URL for the given diagram key, if known and resolved.
    /// Returns nil if the key is not yet in the local cache or has no resolved URL.
    func directURL(for key: String) -> URL? {
        guard let urlString = paths[key], !urlString.isEmpty else { return nil }
        return URL(string: urlString)
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
                saveToDisk(fresh)
                UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: lastFetchKey)
            } catch {
                // Non-fatal: stale on-disk cache will continue serving existing hits.
                // The worker proxy fallback covers any misses.
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
    }

    private func saveToDisk(_ map: [String: String]) {
        guard let data = try? JSONEncoder().encode(map) else { return }
        try? data.write(to: cacheFileURL, options: .atomic)
    }
}
