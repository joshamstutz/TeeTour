import SwiftUI

struct CourseListView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var tripManager: TripManager
    @EnvironmentObject private var settings: Settings
    @State private var selectedCourse: Course?
    @State private var justSelectedCourseId: UUID?
    
    private let courses = Course.sampleCourses
    
    var filteredCourses: [Course] {
        courses.filter { course in
            !settings.excludedStates.contains(course.state)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredCourses) { course in
                VStack(alignment: .leading, spacing: 4) {
                    Text("#\(course.rank). \(course.name)")
                        .font(.headline)
                    Text(course.designer)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    tripManager.addCourse(course)
                    dismiss()  // This will dismiss the sheet and return to map
                }
                .swipeActions {
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            justSelectedCourseId = course.id
                            tripManager.addCourse(course)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                justSelectedCourseId = nil
                            }
                        }
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                    .tint(.green)
                }
                .listRowBackground(
                    justSelectedCourseId == course.id ?
                        Color.green.opacity(0.2) :
                        Color.clear
                )
            }
            .navigationTitle("Course List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .sheet(item: $selectedCourse) { course in
                CourseDetailView(course: course)
            }
        }
    }
} 
