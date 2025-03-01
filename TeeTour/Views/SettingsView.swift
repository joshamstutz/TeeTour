import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settings: Settings
    
    var body: some View {
        List {
            Section("Display") {
                Toggle("Use Metric System", isOn: $settings.useMetricSystem)
            }
            
            Section("Filter States") {
                NavigationLink {
                    StateFilterView(settings: settings)
                } label: {
                    HStack {
                        Text("Excluded States")
                        Spacer()
                        Text("\(settings.excludedStates.count)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StateFilterView: View {
    @ObservedObject var settings: Settings
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    
    var filteredStates: [String] {
        if searchText.isEmpty {
            return Settings.allStates
        }
        return Settings.allStates.filter { $0.contains(searchText.uppercased()) }
    }
    
    var body: some View {
        List {
            ForEach(filteredStates, id: \.self) { state in
                Button {
                    if settings.excludedStates.contains(state) {
                        settings.excludedStates.remove(state)
                    } else {
                        settings.excludedStates.insert(state)
                    }
                } label: {
                    HStack {
                        Text(state)
                        Spacer()
                        if settings.excludedStates.contains(state) {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.blue)
                        }
                    }
                }
                .foregroundStyle(.primary)
            }
        }
        .navigationTitle("Filter States")
        .searchable(text: $searchText, prompt: "Search states")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environmentObject(Settings())
    }
} 
