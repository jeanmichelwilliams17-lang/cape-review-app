// ReviewView.swift — Main flip-through review interface
// Requires: LaTeXSwiftUI package (https://github.com/colinc86/LaTeXSwiftUI)

import SwiftUI
import LaTeXSwiftUI

// MARK: - ReviewView

struct ReviewView: View {

    // One-time identity — set by ReviewerNamePrompt on first launch.
    // Multiple reviewers on the same device just change this in Settings.
    @AppStorage("reviewerName") private var reviewerName = ""

    let paper: Int
    let subjectName: String?  // nil = all subjects

    @State private var questions:     [Question] = []
    @State private var currentIndex:  Int        = 0
    @State private var reviewNote:    String     = ""
    @State private var isLoading:     Bool       = true
    @State private var isSubmitting:  Bool       = false
    @State private var errorMessage:  String?    = nil
    @State private var cursor:        Int        = 0
    @State private var hasMore:       Bool       = true

    private let limit = 30

    var body: some View {
        Group {
            if reviewerName.isEmpty {
                ReviewerNamePrompt(reviewerName: $reviewerName)
            } else if isLoading && questions.isEmpty {
                ProgressView("Loading questions…")
            } else if let error = errorMessage {
                ErrorView(message: error) { loadQuestions() }
            } else if questions.isEmpty {
                ContentUnavailableView(
                    "All Done! 🎉",
                    systemImage: "checkmark.seal.fill",
                    description: Text("No unreviewed questions remain for your current filters.")
                )
            } else {
                mainContent
            }
        }
        .navigationTitle(subjectName.map { "\($0) · Paper \(paper)" } ?? "Paper \(paper) · All Subjects")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .task(id: reviewerName) {
            guard !reviewerName.isEmpty else { return }
            questions = []
            cursor    = 0
            hasMore   = true
            loadQuestions()
        }
    }

    // MARK: Main content

    private var mainContent: some View {
        VStack(spacing: 0) {
            let q = questions[currentIndex]

            // ── Progress bar ─────────────────────────────────────
            ProgressView(value: Double(currentIndex + 1), total: Double(questions.count))
                .tint(.indigo)
                .padding(.horizontal)
                .padding(.top, 8)

            Text("\(currentIndex + 1) of \(questions.count)\(hasMore ? "+" : "")")
                .font(.caption2)
                .foregroundStyle(.secondary)
                .padding(.top, 4)

            // ── Question header ───────────────────────────────────
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(q.subjectName) · Paper \(q.paper) · \(q.questionLabel)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    if let year = q.year, let month = q.month {
                        Text("\(month) \(year)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    } else if let year = q.year {
                        Text("\(year)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    if let topic = q.topic {
                        Text(topic)
                            .font(.caption2)
                            .foregroundStyle(Color.indigo.opacity(0.8))
                    }
                }
                Spacer()
                ReviewBadge(question: q)
            }
            .padding(.horizontal)
            .padding(.top, 12)

            Divider().padding(.top, 8)

            // ── Scrollable body ───────────────────────────────────
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Question text — render the Validated Question Code (LaTeX)
                    LaTeX(stripLaTeXWrapper(q.questionCode))
                        .parsingMode(.onlyEquations)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                    // Optional diagram
                    if q.diagramPresent, let key = q.questionDiagramKey {
                        DiagramView(diagramKey: key)
                    }

                    // Paper 1: answer choices
                    if q.paper == 1, let choices = q.choices, !choices.isEmpty {
                        VStack(spacing: 10) {
                            ForEach(choices) { choice in
                                ChoiceRow(choice: choice, correctLabel: q.correctChoice)
                            }
                        }
                    }

                    // Paper 2: marks indicator
                    if q.paper == 2, let marks = q.marks {
                        HStack {
                            Spacer()
                            Text("[\(marks.formatted()) mark\(marks == 1 ? "" : "s")]")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
            }

            Divider()

            // ── Review controls ───────────────────────────────────
            ReviewControls(
                question:      q,
                reviewer:      reviewerName,
                note:          $reviewNote,
                isSubmitting:  isSubmitting,
                onUnreview:    { unreview(question: q) }
            ) { status in
                submitReview(question: q, status: status)
            }

            // ── Prev / Next navigation ────────────────────────────
            HStack {
                Button("← Previous") {
                    withAnimation { if currentIndex > 0 { currentIndex -= 1 } }
                }
                .disabled(currentIndex == 0)
                .buttonStyle(.borderless)

                Spacer()

                Button("Next →") { advance() }
                    .disabled(currentIndex == questions.count - 1 && !hasMore)
                    .buttonStyle(.borderless)
            }
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
    }

    private func advance() {
        reviewNote = ""
        errorMessage = nil
        withAnimation {
            if currentIndex < questions.count - 1 {
                currentIndex += 1
                // Pre-fetch next batch when within 5 of the end
                if currentIndex >= questions.count - 5 && hasMore {
                    loadQuestions()
                }
            }
        }
    }

    // MARK: - Networking

    private func loadQuestions() {
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let batch = try await APIClient.shared.fetchQuestions(
                    paper:        paper,
                    subject:      subjectName,
                    reviewer:     reviewerName,
                    reviewStatus: "unreviewed",
                    cursor:       cursor,
                    limit:        limit
                )
                questions.append(contentsOf: batch)
                hasMore   = batch.count == limit
                cursor   += batch.count
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    private func submitReview(question: Question, status: String) {
        isSubmitting = true
        Task {
            do {
                try await APIClient.shared.submitReview(
                    questionID: question.id,
                    reviewer:   reviewerName,
                    status:     status,
                    note:       reviewNote.isEmpty ? nil : reviewNote
                )
                advance()
            } catch {
                errorMessage = error.localizedDescription
            }
            isSubmitting = false
        }
    }

    private func unreview(question: Question) {
        isSubmitting = true
        Task {
            do {
                try await APIClient.shared.deleteReview(
                    questionID: question.id,
                    reviewer:   reviewerName
                )
                advance()
            } catch {
                errorMessage = error.localizedDescription
            }
            isSubmitting = false
        }
    }
}

// MARK: - Helpers

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
    return s
}

// MARK: - Supporting views

struct ReviewBadge: View {
    let question: Question
    var body: some View {
        if question.reviewCount == 0 { EmptyView() }
        else {
            Label(
                question.hasConflictingReviews
                    ? "⚠ Conflict (\(question.reviewCount))"
                    : "Reviewed \(question.reviewCount)×",
                systemImage: question.hasConflictingReviews ? "exclamationmark.triangle" : "checkmark.circle"
            )
            .font(.caption2)
            .foregroundStyle(question.hasConflictingReviews ? Color.orange : Color.secondary)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                Capsule().fill(question.hasConflictingReviews
                    ? Color.orange.opacity(0.12)
                    : Color.secondary.opacity(0.12))
            )
        }
    }
}

struct ChoiceRow: View {
    let choice: Choice
    let correctLabel: String?

    var isCorrect: Bool { choice.label == correctLabel }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(choice.label)
                .font(.headline)
                .foregroundStyle(isCorrect ? Color.green : Color.primary)
                .frame(width: 24)
            // Render the validated answer code (LaTeX)
            LaTeX(stripLaTeXWrapper(choice.answerCode))
                .parsingMode(.onlyEquations)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            if let key = choice.diagramKey {
                DiagramView(diagramKey: key)
                    .frame(maxWidth: 120)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(isCorrect ? Color.green.opacity(0.10) : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isCorrect ? Color.green.opacity(0.4) : Color.secondary.opacity(0.2))
                )
        )
    }
}

struct ErrorView: View {
    let message: String
    let retry: () -> Void
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 44))
                .foregroundStyle(.red.opacity(0.8))
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button("Try Again", action: retry)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
