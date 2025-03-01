import SwiftUI

struct CourseDetailSheet: View {
    let course: Course
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var tripManager: TripManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Course Details") {
                    LabeledContent("Rank", value: "#\(course.rank)")
                    LabeledContent("Designer", value: course.designer)
                    LabeledContent("Year Built", value: "\(course.yearBuilt)")
                    LabeledContent("Par", value: "\(course.par)")
                    LabeledContent("State", value: course.state)
                }
                
                Section("Description") {
                    Text(course.description)
                }
                
                Section {
                    Button {
                        tripManager.addCourse(course)
                        dismiss()
                    } label: {
                        Label("Add to Trip", systemImage: "plus")
                            .frame(maxWidth: .infinity)
                    }
                    .tint(.green)
                }
            }
            .navigationTitle(course.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
} 
