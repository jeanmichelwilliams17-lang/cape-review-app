// StatsView.swift — Per-subject/paper review progress screen
import SwiftUI

struct StatsView: View {
    @State private var stats:      [SubjectStats] = []
    @State private var isLoading:  Bool           = true
    @State private var errorMsg:   String?        = nil

    var body: some View {
        Group {
            if isLoading {
                ProgressView("Loading stats…")
            } else if let err = errorMsg {
                ErrorView(message: err) { loadStats() }
            } else if stats.isEmpty {
                ContentUnavailableView(
                    "No Data",
                    systemImage: "chart.bar",
                    description: Text("Load some questions first via the Admin UI.")
                )
            } else {
                List(stats) { s in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(s.subject)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Paper \(s.paper)")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Capsule().fill(s.paper == 1 ? Color.indigo : Color.teal))
                        }

                        HStack(spacing: 16) {
                            StatPill(label: "Total",      value: s.total,      colour: .gray)
                            StatPill(label: "Reviewed",   value: s.reviewed,   colour: .green)
                            StatPill(label: "Unreviewed", value: s.unreviewed, colour: .orange)
                            if s.conflicts > 0 {
                                StatPill(label: "Conflicts", value: s.conflicts, colour: .red)
                            }
                        }

                        ProgressView(value: s.reviewPct, total: 100)
                            .tint(progressColour(pct: s.reviewPct))

                        Text(String(format: "%.1f%% reviewed", s.reviewPct))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 6)
                }
                #if os(iOS)
                .listStyle(.insetGrouped)
                #endif
            }
        }
        .navigationTitle("Review Stats")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
        .task { loadStats() }
        .refreshable { loadStats() }
    }

    private func loadStats() {
        isLoading = true
        errorMsg  = nil
        Task {
            do { stats = try await APIClient.shared.fetchStats() }
            catch { errorMsg = error.localizedDescription }
            isLoading = false
        }
    }

    private func progressColour(pct: Double) -> Color {
        pct < 33 ? .red : pct < 66 ? .orange : .green
    }
}

struct StatPill: View {
    let label:  String
    let value:  Int
    let colour: Color
    var body: some View {
        VStack(spacing: 2) {
            Text("\(value)").font(.headline).foregroundStyle(colour)
            Text(label).font(.caption2).foregroundStyle(.secondary)
        }
    }
}
