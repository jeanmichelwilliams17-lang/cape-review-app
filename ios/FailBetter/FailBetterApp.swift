// FailBetterApp.swift — App entry point
import SwiftUI

@main
struct FailBetterApp: App {

    init() {
        // Configure a large URL cache so pre-fetched diagram images
        // stay on device across questions without being evicted.
        // Default is only 512 KB memory / 10 MB disk — far too small.
        URLCache.shared = URLCache(
            memoryCapacity:  50  * 1024 * 1024,  // 50 MB
            diskCapacity:    500 * 1024 * 1024,  // 500 MB
            diskPath:        "DiagramImageCache"
        )

        // Refresh on-device diagram key -> ImageKit URL cache in background
        DiagramPathCache.shared.refresh()
    }

    var body: some Scene {
        WindowGroup {
            SubjectPickerView()
        }
    }
}
