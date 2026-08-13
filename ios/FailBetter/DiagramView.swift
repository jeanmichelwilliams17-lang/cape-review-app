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
                        .frame(maxWidth: .infinity)

                case .failure:
                    // Fail silently — many questions simply have no diagram.
                    EmptyView()

                case .empty:
                    ProgressView()
                        .controlSize(.small)
                        .frame(maxWidth: .infinity)

                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
