// SettingsView.swift — API config + reviewer identity management
import SwiftUI

struct SettingsView: View {
    @AppStorage("reviewerName") private var reviewerName = ""
    @AppStorage("workerURL")    private var workerURL    = ""
    @AppStorage("apiToken")     private var apiToken     = ""

    @State private var showTokenClearConfirm = false
    @State private var testResult: String?   = nil
    @State private var isTesting: Bool       = false

    var body: some View {
        Form {
            // ── Identity ──────────────────────────────────────────
            Section {
                HStack {
                    Text("Reviewer Name")
                    Spacer()
                    TextField("Your name", text: $reviewerName)
                        .multilineTextAlignment(.trailing)
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("Identity")
            } footer: {
                Text("Your name is stored locally and attached to every review you submit. Changing it here affects all future submissions from this device.")
            }

            // ── API Config ────────────────────────────────────────
            Section {
                HStack {
                    Text("Worker URL")
                    Spacer()
                    TextField("https://…", text: $workerURL)
                        .multilineTextAlignment(.trailing)
                        .foregroundStyle(.secondary)
                        .autocorrectionDisabled()
                        #if os(iOS)
                        .textInputAutocapitalization(.never)
                        #endif
                }
                HStack {
                    Text("Bearer Token")
                    Spacer()
                    SecureField("Token", text: $apiToken)
                        .multilineTextAlignment(.trailing)
                        .foregroundStyle(.secondary)
                        .autocorrectionDisabled()
                        #if os(iOS)
                        .textInputAutocapitalization(.never)
                        #endif
                }
            } header: {
                Text("API Configuration")
            } footer: {
                Text("Get these values from whoever deployed the Cloudflare Worker.")
            }

            // ── Connection test ───────────────────────────────────
            Section {
                Button(action: testConnection) {
                    HStack {
                        Text("Test Connection")
                        Spacer()
                        if isTesting {
                            ProgressView()
                        } else if let result = testResult {
                            Text(result)
                                .font(.caption)
                                .foregroundStyle(result.hasPrefix("✓") ? .green : .red)
                        }
                    }
                }
                .disabled(isTesting || workerURL.isEmpty || apiToken.isEmpty)
            }

            // ── Reset queue ───────────────────────────────────────
            Section {
                Button("Reset Queue") {
                    // Clearing the in-memory cache would require a coordinator pattern;
                    // for now, a fresh launch (close + reopen app) re-fetches from the API.
                    testResult = "Re-launch the app to reset the local question cache."
                }
                .foregroundStyle(.orange)
            } footer: {
                Text("Clears locally cached questions and re-fetches from the API on next launch.")
            }

            // ── App info ──────────────────────────────────────────
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—")
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("About")
            }
        }
        .navigationTitle("Settings")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
        // Save values to UserDefaults on every keystroke via @AppStorage — no save button needed.
        .onChange(of: workerURL) { UserDefaults.standard.set(workerURL, forKey: "workerURL") }
        .onChange(of: apiToken)  { UserDefaults.standard.set(apiToken,  forKey: "apiToken")  }
    }

    private func testConnection() {
        isTesting  = true
        testResult = nil
        Task {
            do {
                _ = try await APIClient.shared.fetchSubjects()
                testResult = "✓ Connected"
            } catch {
                testResult = "✗ \(error.localizedDescription)"
            }
            isTesting = false
        }
    }
}
