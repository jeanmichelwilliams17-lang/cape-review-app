// FixedQuestionsReviewView.swift — Dedicated Mobile Interface for Reviewing Fixed Questions
import SwiftUI
import LaTeXSwiftUI

struct FixedQuestionsReviewView: View {
    @AppStorage("reviewerName") private var reviewerName = ""

    @State private var items: [FixedQuestion] = []
    @State private var currentIndex: Int = 0
    @State private var isLoading: Bool = true
    @State private var errorMessage: String? = nil
    @State private var showOriginalText: Bool = false
    @State private var reviewNote: String = ""
    @State private var isSubmitting: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            if isLoading {
                ProgressView("Loading fixed questions…")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage {
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 40))
                        .foregroundStyle(.orange)
                    Text("Failed to Load")
                        .font(.headline)
                    Text(errorMessage)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    Button("Retry") { loadData() }
                        .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if items.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.green)
                    Text("No Fixed Questions Pending")
                        .font(.title3)
                        .bold()
                    Text("All proposed LaTeX fixes have been reviewed or applied!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                let currentItem = items[currentIndex]

                // ── Top header bar ──────────────────────────────────────────
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(currentItem.subjectName) · Paper \(currentItem.paper)")
                            .font(.subheadline)
                            .bold()
                        Text("Question \(currentItem.number) \(currentItem.year != nil ? "(\(currentItem.year!))" : "")")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text("\(currentIndex + 1) of \(items.count)")
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.secondary.opacity(0.15)))
                }
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))

                // ── Version Toggle Picker ─────────────────────────────────
                Picker("Version", selection: $showOriginalText) {
                    Text("Fixed Version ✨").tag(false)
                    Text("Original Version").tag(true)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.vertical, 8)

                // ── Content View ──────────────────────────────────────────
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        let textToRender = showOriginalText
                            ? (currentItem.originalQuestionCode ?? currentItem.originalQuestionRaw)
                            : (currentItem.fixedQuestionCode ?? currentItem.fixedQuestionRaw)

                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Label(
                                    showOriginalText ? "Original (Before Fix)" : "Proposed Fix (\(currentItem.fixType))",
                                    systemImage: showOriginalText ? "clock.arrow.circlepath" : "sparkles"
                                )
                                .font(.caption)
                                .bold()
                                .foregroundStyle(showOriginalText ? Color.orange : Color.green)
                                Spacer()
                            }

                            LaTeX(stripLaTeXWrapper(textToRender))
                                .parsingMode(.onlyEquations)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(showOriginalText ? Color.orange.opacity(0.06) : Color.green.opacity(0.06))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(showOriginalText ? Color.orange.opacity(0.3) : Color.green.opacity(0.3))
                                        )
                                )
                        }

                        // Optional Note Input
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Reviewer Note (optional)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            TextField("e.g. Looks good! / Space missing near \\sqrt", text: $reviewNote)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    .padding()
                }

                Divider()

                // ── Bottom Review Controls ────────────────────────────────
                HStack(spacing: 16) {
                    Button {
                        submitReview(status: "approved")
                    } label: {
                        Label("Approve Fix", systemImage: "checkmark.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .disabled(isSubmitting)

                    Button {
                        submitReview(status: "needs_fix")
                    } label: {
                        Label("Needs Fix", systemImage: "exclamationmark.triangle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .disabled(isSubmitting)
                }
                .padding()
                .background(Color(uiColor: .systemBackground))
            }
        }
        .navigationTitle("Review Fixed Questions")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { loadData() }
    }

    private func loadData() {
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let fetched = try await APIClient.shared.fetchFixedQuestions(status: "pending")
                await MainActor.run {
                    self.items = fetched
                    self.currentIndex = 0
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }

    private func submitReview(status: String) {
        guard !items.isEmpty, currentIndex < items.count else { return }
        let currentItem = items[currentIndex]
        let name = reviewerName.trimmingCharacters(in: .whitespacesAndNewlines)
        let finalReviewer = name.isEmpty ? "Anonymous Reviewer" : name

        isSubmitting = true
        Task {
            do {
                try await APIClient.shared.submitFixedQuestionReview(
                    fixedQuestionId: currentItem.id,
                    reviewer: finalReviewer,
                    status: status,
                    note: reviewNote.isEmpty ? nil : reviewNote
                )
                await MainActor.run {
                    self.reviewNote = ""
                    self.isSubmitting = false
                    if self.currentIndex < self.items.count - 1 {
                        self.currentIndex += 1
                    } else {
                        self.items.remove(at: self.currentIndex)
                        if self.currentIndex >= self.items.count {
                            self.currentIndex = max(0, self.items.count - 1)
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    self.isSubmitting = false
                }
            }
        }
    }

    private func stripLaTeXWrapper(_ text: String) -> String {
        var s = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if let r = s.range(of: #"^LaTeX\(""#, options: .regularExpression) {
            s = String(s[r.upperBound...])
        }
        if let r = s.range(of: #""\)\.parsingMode\(.onlyEquations\)$"#, options: .regularExpression) {
            s = String(s[..<r.lowerBound])
        }
        if let r = s.range(of: #""\)$"#, options: .regularExpression) {
            s = String(s[..<r.lowerBound])
        }
        s = s.replacingOccurrences(of: "\\\\", with: "\\")
        s = s.replacingOccurrences(of: "\\n", with: "\n")
        guard !s.isEmpty else { return s }

        let sNoEscDollar = s.replacingOccurrences(of: "\\$", with: "")
        if sNoEscDollar.contains("$") || s.contains("\\(") || s.contains("\\[") {
            return s
        }
        let isBare = s.hasPrefix("\\") || s.contains("^") || s.contains("_") || (s.contains("{") && s.contains("}"))
        if isBare { return "$\(s)$" }
        return s
    }
}
