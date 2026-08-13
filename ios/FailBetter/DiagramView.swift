// DiagramView.swift — Async image from the Worker /images/:key endpoint
import SwiftUI

struct DiagramView: View {
    let diagramKey: String

    private var imageURL: URL? {
        APIClient.shared.imageURL(forDiagramKey: diagramKey)
    }

    var body: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)

                case .failure:
                    // Fail silently — many questions simply have no diagram.
                    // The `diagram_present` flag on the parent view guards this,
                    // so if we're here and there's a genuine 404 it just disappears.
                    EmptyView()

                case .empty:
                    ProgressView()
                        .controlSize(.small)

                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
