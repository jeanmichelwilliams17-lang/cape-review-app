// SubjectPickerView.swift — Subject + paper selection before entering ReviewView
import SwiftUI

struct SubjectPickerView: View {
    @AppStorage("reviewerName") private var reviewerName = ""
    @State private var subjects:    [Subject] = []
    @State private var isLoading:   Bool      = true
    @State private var errorMsg:    String?   = nil

    private var groupedSubjects: [(name: String, entries: [Subject])] {
        let grouped = Dictionary(grouping: subjects, by: \.name)
        return grouped.keys.sorted().map { name in
            (name: name, entries: grouped[name]!.sorted { ($0.year ?? 0) < ($1.year ?? 0) })
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading subjects…")
                } else if let err = errorMsg {
                    ErrorView(message: err) { loadSubjects() }
                } else {
                    List {
                        Section {
                            NavigationLink(value: Route.fixedQuestions) {
                                HStack {
                                    Label("Review Fixed Questions", systemImage: "sparkles")
                                        .font(.headline)
                                        .foregroundStyle(.purple)
                                    Spacer()
                                }
                                .padding(.vertical, 2)
                            }
                            NavigationLink(value: Route.review(paper: 1, subject: nil, year: nil)) {
                                SubjectRow(name: "All Subjects — Paper 1",
                                           count: subjects.compactMap(\.p1Count).reduce(0, +),
                                           paper: 1)
                            }
                            NavigationLink(value: Route.review(paper: 2, subject: nil, year: nil)) {
                                SubjectRow(name: "All Subjects — Paper 2",
                                           count: subjects.compactMap(\.p2Count).reduce(0, +),
                                           paper: 2)
                            }
                        } header: {
                            Text("Quick Start")
                        }

                        Section {
                            ForEach(groupedSubjects, id: \.name) { group in
                                DisclosureGroup {
                                    ForEach(group.entries) { subj in
                                        if let year = subj.year {
                                            if let c = subj.p1Count, c > 0 {
                                                NavigationLink(value: Route.review(paper: 1, subject: subj.name, year: year)) {
                                                    SubjectRow(name: "\(year) Paper 1", count: c, paper: 1)
                                                }
                                            }
                                            if let c = subj.p2Count, c > 0 {
                                                NavigationLink(value: Route.review(paper: 2, subject: subj.name, year: year)) {
                                                    SubjectRow(name: "\(year) Paper 2", count: c, paper: 2)
                                                }
                                            }
                                        } else {
                                            if let c = subj.p1Count, c > 0 {
                                                NavigationLink(value: Route.review(paper: 1, subject: subj.name, year: nil)) {
                                                    SubjectRow(name: "Paper 1", count: c, paper: 1)
                                                }
                                            }
                                            if let c = subj.p2Count, c > 0 {
                                                NavigationLink(value: Route.review(paper: 2, subject: subj.name, year: nil)) {
                                                    SubjectRow(name: "Paper 2", count: c, paper: 2)
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    Text(group.name)
                                        .fontWeight(.medium)
                                }
                            }
                        } header: {
                            Text("By Subject")
                        }
                    }
                    #if os(iOS)
                    .listStyle(.insetGrouped)
                    #endif
                }
            }
            .navigationTitle("CAPE Review")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .review(let paper, let subject, let year):
                    ReviewView(paper: paper, subjectName: subject, year: year)
                case .fixedQuestions:
                    FixedQuestionsReviewView()
                case .stats:
                    StatsView()
                case .settings:
                    SettingsView()
                }
            }
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: Route.stats) {
                        Image(systemName: "chart.bar.fill")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: Route.settings) {
                        Image(systemName: "gearshape.fill")
                    }
                }
                #else
                ToolbarItem(placement: .navigation) {
                    NavigationLink(value: Route.stats) {
                        Image(systemName: "chart.bar.fill")
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(value: Route.settings) {
                        Image(systemName: "gearshape.fill")
                    }
                }
                #endif
            }
            .task { loadSubjects() }
            .refreshable { loadSubjects() }
        }
    }

    private func loadSubjects() {
        isLoading = true
        errorMsg  = nil
        Task {
            do {
                subjects  = try await APIClient.shared.fetchSubjects()
            } catch {
                errorMsg  = error.localizedDescription
            }
            isLoading = false
        }
    }
}

// ── Route enum for NavigationStack typed destinations ────────────────────────
enum Route: Hashable {
    case review(paper: Int, subject: String?, year: Int?)
    case fixedQuestions
    case stats
    case settings
}

// ── Small row component ───────────────────────────────────────────────────────
struct SubjectRow: View {
    let name:  String
    let count: Int
    let paper: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.subheadline)
                Text("\(count) questions")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("P\(paper)")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(Capsule().fill(paper == 1 ? Color.indigo : Color.teal))
        }
    }
}
