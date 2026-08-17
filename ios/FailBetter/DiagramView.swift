// DiagramView.swift — Async image from the Worker /images/:key endpoint
import SwiftUI

struct DiagramView: View {
    let diagramKey: String

    @State private var showPlaceholder = false

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
                    // Image not found — collapse to nothing.
                    EmptyView()

                case .empty:
                    // Only show the placeholder after a short delay so that
                    // fast 404s (questions with no diagram) never flash a box.
                    if showPlaceholder {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.secondary.opacity(0.12))
                            .aspectRatio(4 / 3, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                ProgressView()
                                    .controlSize(.small)
                            )
                    }

                @unknown default:
                    EmptyView()
                }
            }
            .onAppear {
                showPlaceholder = false
                Task {
                    // 200 ms grace period — if the image resolves (success or 404)
                    // before this fires the placeholder is never shown.
                    try? await Task.sleep(nanoseconds: 200_000_000)
                    showPlaceholder = true
                }
            }
            .onDisappear {
                showPlaceholder = false
            }
        }
    }
}
