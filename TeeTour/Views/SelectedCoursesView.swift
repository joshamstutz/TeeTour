import SwiftUI

struct SelectedCoursesView: View {
    @EnvironmentObject var tripManager: TripManager
    @State private var editMode: EditMode = .inactive
    @State private var selectedCourseIds: Set<UUID> = []
    @State private var showingCreateTrip = false
    @State private var tripName = ""
    
    var body: some View {
        List(selection: $selectedCourseIds) {
            if !tripManager.trips.isEmpty {
                TripGroupsSection(trips: tripManager.trips)
                    .selectionDisabled(true)
            }
            
            UngroupedCoursesSection(
                courses: tripManager.selectedCourses,
                onDelete: { indexSet in
                    for index in indexSet {
                        tripManager.removeCourse(tripManager.selectedCourses[index])
                    }
                }
            )
        }
        .navigationTitle("Selected Courses")
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.editMode, $editMode)
        .overlay {
            if tripManager.selectedCourses.isEmpty && tripManager.trips.isEmpty {
                EmptyStateView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Selected Courses")
                }
                .font(.headline)
            }
            if !tripManager.selectedCourses.isEmpty {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        if editMode.isEditing {
                            Button {
                                withAnimation {
                                    editMode = .inactive
                                    selectedCourseIds.removeAll()
                                }
                            } label: {
                                Text("Done")
                            }
                            
                            if !selectedCourseIds.isEmpty {
                                Button {
                                    showingCreateTrip = true
                                } label: {
                                    Text("Group")
                                }
                            }
                        } else {
                            Button {
                                withAnimation {
                                    editMode = .active
                                }
                            } label: {
                                Text("Select")
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingCreateTrip) {
            CreateTripSheet(
                tripName: $tripName,
                selectedIds: selectedCourseIds,
                courses: tripManager.selectedCourses,
                showingSheet: $showingCreateTrip,
                editMode: $editMode,
                onCreateTrip: { name, selectedCourses in
                    tripManager.createTrip(name: name, courses: selectedCourses)
                }
            )
        }
    }
}

// MARK: - Supporting Views
struct TripGroupsSection: View {
    let trips: [Trip]
    @State private var selectedTripId: UUID?
    
    var body: some View {
        if !trips.isEmpty {
            Section("Trips") {
                ForEach(trips) { trip in
                    DisclosureGroup(
                        content: {
                            ForEach(trip.courses) { course in
                                CourseRow(course: course)
                                    .foregroundStyle(.secondary)
                            }
                        },
                        label: {
                            HStack {
                                Text(trip.name)
                                    .font(.headline)
                                Spacer()
                                Text("\(trip.courses.count) courses")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    )
                }
            }
        }
    }
}

struct UngroupedCoursesSection: View {
    let courses: [Course]
    let onDelete: (IndexSet) -> Void
    
    var body: some View {
        Section("Courses") {
            ForEach(courses) { course in
                CourseRow(course: course)
            }
            .onDelete(perform: onDelete)
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView(
            "No Courses Selected",
            systemImage: "flag.slash",
            description: Text("Start by exploring courses and adding them to your trip")
        )
    }
}

struct CreateTripSheet: View {
    @Binding var tripName: String
    let selectedIds: Set<UUID>
    let courses: [Course]
    @Binding var showingSheet: Bool
    @Binding var editMode: EditMode
    let onCreateTrip: (String, [Course]) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Trip Name") {
                    TextField("Enter trip name", text: $tripName)
                }
                
                Section("Selected Courses") {
                    ForEach(courses.filter { selectedIds.contains($0.id) }) { course in
                        HStack {
                            Text("#\(course.rank)")
                                .foregroundStyle(.secondary)
                            Text(course.name)
                        }
                    }
                }
            }
            .navigationTitle("Create Trip Group")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showingSheet = false
                        tripName = ""
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        let selectedCourses = courses.filter { selectedIds.contains($0.id) }
                        onCreateTrip(tripName, selectedCourses)
                        showingSheet = false
                        tripName = ""
                        editMode = .inactive
                    }
                    .disabled(tripName.isEmpty)
                }
            }
        }
        .presentationDetents([.medium])
    }
}

struct CourseRow: View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("#\(course.rank). \(course.name)")
                    .font(.headline)
                Spacer()
            }
            
            Text(course.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        SelectedCoursesView()
            .environmentObject(TripManager())
    }
} 
