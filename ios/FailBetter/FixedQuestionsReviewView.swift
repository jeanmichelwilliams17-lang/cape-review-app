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

                // ── Top Header & Jump Menu Bar ──────────────────────────────
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        let sitStr = "\(currentItem.subjectName) · Paper \(currentItem.paper)\(currentItem.year != nil ? " · " + (currentItem.month ?? "") + " " + String(currentItem.year!) : "")"
                        let partStr = (currentItem.part != nil && !currentItem.part!.isEmpty) ? " (\(currentItem.part!))" : ""
                        let subpartStr = (currentItem.subpart != nil && !currentItem.subpart!.isEmpty) ? " (\(currentItem.subpart!))" : ""
                        let qTitle = "Question \(currentItem.number)\(partStr)\(subpartStr)"

                        Text(sitStr)
                            .font(.subheadline)
                            .bold()
                        Text("\(qTitle) · Fix #\(currentItem.id)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()

                    // Dropdown menu to jump to any question
                    Menu {
                        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                            let itemPart = (item.part != nil && !item.part!.isEmpty) ? " (\(item.part!))" : ""
                            let itemSubpart = (item.subpart != nil && !item.subpart!.isEmpty) ? " (\(item.subpart!))" : ""
                            let itemTitle = "Q\(item.number)\(itemPart)\(itemSubpart)"
                            Button {
                                currentIndex = index
                            } label: {
                                HStack {
                                    Text("#\(index + 1): \(item.subjectName) P\(item.paper) \(item.year != nil ? "(\(item.year!))" : "") \(itemTitle) [#\(item.id)]")
                                    if index == currentIndex {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text("\(currentIndex + 1) of \(items.count)")
                                .font(.caption)
                                .bold()
                            Image(systemName: "chevron.down")
                                .font(.caption2)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Capsule().fill(Color.purple.opacity(0.12)))
                        .foregroundStyle(.purple)
                    }
                }
                .padding()
                .background(Color(uiColor: .systemGroupedBackground))

                // ── Skip Navigation Bar (Prev / Next & Direct Jump) ────────
                HStack {
                    Button {
                        if currentIndex > 0 { currentIndex -= 1 }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Prev")
                        }
                        .font(.subheadline)
                    }
                    .disabled(currentIndex == 0)

                    Spacer()

                    Menu {
                        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                            let itemPart = (item.part != nil && !item.part!.isEmpty) ? " (\(item.part!))" : ""
                            let itemSubpart = (item.subpart != nil && !item.subpart!.isEmpty) ? " (\(item.subpart!))" : ""
                            let itemTitle = "Q\(item.number)\(itemPart)\(itemSubpart)"
                            Button {
                                currentIndex = index
                            } label: {
                                HStack {
                                    Text("#\(index + 1): \(item.subjectName) P\(item.paper) \(item.year != nil ? "(\(item.year!))" : "") \(itemTitle) [#\(item.id)]")
                                    if index == currentIndex {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "list.bullet")
                                .font(.caption)
                            Text("Skip to Question")
                                .font(.caption)
                                .bold()
                            Image(systemName: "chevron.up.chevron.down")
                                .font(.caption2)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.secondary.opacity(0.12)))
                        .foregroundStyle(.primary)
                    }

                    Spacer()

                    Button {
                        if currentIndex < items.count - 1 { currentIndex += 1 }
                    } label: {
                        HStack(spacing: 4) {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        .font(.subheadline)
                    }
                    .disabled(currentIndex >= items.count - 1)
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
                .background(Color(uiColor: .secondarySystemGroupedBackground))

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

                        // Paper 1 MCQ Choices (A, B, C, D)
                        if currentItem.paper == 1, let choices = currentItem.choices, !choices.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Multiple Choice Options")
                                        .font(.caption)
                                        .bold()
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    if let key = currentItem.correctChoice, !key.isEmpty {
                                        Text("Answer Key: Option \(key)")
                                            .font(.caption2)
                                            .bold()
                                            .foregroundStyle(.green)
                                    }
                                }

                                ForEach(choices, id: \.label) { choice in
                                    let isCorrect = (choice.label == currentItem.correctChoice)
                                    HStack(alignment: .top, spacing: 10) {
                                        Text("\(choice.label).")
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundStyle(isCorrect ? Color.green : Color.primary)
                                            .frame(width: 24, alignment: .leading)

                                        LaTeX(stripLaTeXWrapper(choice.answerCode.isEmpty ? choice.answerRaw : choice.answerCode))
                                            .parsingMode(.onlyEquations)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .multilineTextAlignment(.leading)

                                        Spacer()

                                        if isCorrect {
                                            Text("✓ Key")
                                                .font(.caption2)
                                                .bold()
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 2)
                                                .background(Capsule().fill(Color.green.opacity(0.15)))
                                                .foregroundStyle(.green)
                                        }
                                    }
                                    .padding(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(isCorrect ? Color.green.opacity(0.06) : Color.secondary.opacity(0.05))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(isCorrect ? Color.green.opacity(0.3) : Color.clear)
                                            )
                                    )
                                }
                            }
                            .padding(.top, 4)
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
                .id(currentIndex)
                .onChange(of: currentIndex) {
                    reviewNote = ""
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
        s = s.replacingOccurrences(of: #"(\d)(\\+(?:log|ln|alpha|beta|theta|pi|gamma|sigma|mu|lambda|delta|omega|phi|psi|Phi|Theta|Pi|Sigma|Omega|Lambda|Delta|sin|cos|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|sqrt|frac|lim|int|sum|prod|cdot|times|div|pm|mp|partial|infty))(?![a-zA-Z])"#, with: "$1 $2", options: .regularExpression)
        s = s.replacingOccurrences(of: #"\\(sum|lim|prod|int|min|max|sup|inf)_\{(?!\()([^()}]*(?:=|\\to|\\rightarrow)[^()}]*)\}"#, with: #"\\$1_{($2)}"#, options: .regularExpression)
        s = s.replacingOccurrences(of: #"\\(cos|sin|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|ln|log)\^\{-(?!\()([^}]+)\}"#, with: #"\\$1^{(-$2)}"#, options: .regularExpression)
        s = s.replacingOccurrences(of: #"(\d)\s*\^(?:\{([^}]+)\}|([a-zA-Z0-9]))"#, with: "$1 {^$2$3}", options: .regularExpression)
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
