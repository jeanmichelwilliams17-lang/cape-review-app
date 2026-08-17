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
                        .transition(.opacity.animation(.easeIn(duration: 0.2)))

                case .failure:
                    // Fail silently — many questions simply have no diagram.
                    EmptyView()

                case .empty:
                    // Stable grey placeholder — prevents the ambiguous floating
                    // spinner from being mistaken for the next question's image.
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.secondary.opacity(0.12))
                        .aspectRatio(4 / 3, contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            ProgressView()
                                .controlSize(.small)
                        )

                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
