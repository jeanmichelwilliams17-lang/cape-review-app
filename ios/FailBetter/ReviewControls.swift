// ReviewControls.swift — Correct / Needs Fix buttons + optional note
import SwiftUI

struct ReviewControls: View {
    let question:     Question
    let reviewer:     String
    @Binding var note: String
    let isSubmitting: Bool
    let onSubmit:     (String) -> Void   // called with "correct" or "needs_fix"

    @State private var warnMissingNote = false

    var body: some View {
        VStack(spacing: 10) {
            // Optional note field
            TextField("Note (optional — required for Needs Fix)", text: $note, axis: .vertical)
                .lineLimit(1...3)
                .textFieldStyle(.roundedBorder)
                .overlay(
                    warnMissingNote
                        ? RoundedRectangle(cornerRadius: 6).stroke(Color.orange, lineWidth: 1.5)
                        : nil
                )

            HStack(spacing: 12) {
                // ✅ Correct
                Button {
                    warnMissingNote = false
                    onSubmit("correct")
                } label: {
                    Label("Correct", systemImage: "checkmark.circle.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .disabled(isSubmitting)

                // ⚠ Needs Fix
                Button {
                    if note.trimmingCharacters(in: .whitespaces).isEmpty {
                        withAnimation { warnMissingNote = true }
                        // Warn but don't block — still allow submission without a note
                    } else {
                        warnMissingNote = false
                    }
                    onSubmit("needs_fix")
                } label: {
                    Label("Needs Fix", systemImage: "exclamationmark.triangle.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .disabled(isSubmitting)
            }

            if isSubmitting {
                ProgressView()
                    .progressViewStyle(.linear)
                    .tint(.indigo)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color(.systemGroupedBackground))
        .onChange(of: question.id) {
            // Reset warning when question changes
            warnMissingNote = false
        }
    }
}
