// SubjectPickerView.swift — Subject + paper selection before entering ReviewView
import SwiftUI

struct SubjectPickerView: View {
    @AppStorage("reviewerName") private var reviewerName = ""
    @State private var subjects:    [Subject] = []
    @State private var isLoading:   Bool      = true
    @State private var errorMsg:    String?   = nil

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
                            // "All subjects" quick-start entries
                            NavigationLink(value: Route.review(paper: 1, subject: nil)) {
                                SubjectRow(name: "All Subjects — Paper 1",
                                           count: subjects.compactMap(\.p1Count).reduce(0, +),
                                           paper: 1)
                            }
                            NavigationLink(value: Route.review(paper: 2, subject: nil)) {
                                SubjectRow(name: "All Subjects — Paper 2",
                                           count: subjects.compactMap(\.p2Count).reduce(0, +),
                                           paper: 2)
                            }
                        } header: {
                            Text("Quick Start")
                        }

                        Section {
                            ForEach(subjects) { subj in
                                DisclosureGroup {
                                    if let c = subj.p1Count, c > 0 {
                                        NavigationLink(value: Route.review(paper: 1, subject: subj.name)) {
                                            SubjectRow(name: "Paper 1", count: c, paper: 1)
                                        }
                                    }
                                    if let c = subj.p2Count, c > 0 {
                                        NavigationLink(value: Route.review(paper: 2, subject: subj.name)) {
                                            SubjectRow(name: "Paper 2", count: c, paper: 2)
                                        }
                                    }
                                } label: {
                                    Text(subj.name)
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
                case .review(let paper, let subject):
                    ReviewView(paper: paper, subjectName: subject)
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
    case review(paper: Int, subject: String?)
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
