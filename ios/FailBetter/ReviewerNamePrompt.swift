// ReviewerNamePrompt.swift — First-launch reviewer identity screen
import SwiftUI

struct ReviewerNamePrompt: View {
    @Binding var reviewerName: String
    @State private var input = ""

    var isValid: Bool {
        !input.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "person.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(Color.indigo.gradient)

            VStack(spacing: 8) {
                Text("Who's reviewing?")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Your name is saved on this device and attached to every\nreview you submit. You can change it later in Settings.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            TextField("Your name (e.g. Aria)", text: $input)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 40)
                .submitLabel(.done)
                .onSubmit { commitName() }

            Button("Continue", action: commitName)
                .buttonStyle(.borderedProminent)
                .disabled(!isValid)
                .controlSize(.large)

            Spacer()
        }
        .padding()
    }

    private func commitName() {
        let trimmed = input.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        reviewerName = trimmed
    }
}
