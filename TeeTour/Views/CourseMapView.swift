import SwiftUI
import MapKit

struct CourseMapView: View {
    @EnvironmentObject private var settings: Settings
    @State private var selectedCourse: Course?
    @State private var showingCourseDetail = false
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),
            span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 60)
        )
    )
    
    private let courses = Course.sampleCourses
    
    var filteredCourses: [Course] {
        courses.filter { course in
            !settings.excludedStates.contains(course.state)
        }
    }
    
    struct RoundedCorners: Shape {
        var radius: CGFloat
        var corners: UIRectCorner

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                mapView
                coursePreviewCardIfSelected
            }
            .navigationTitle("Top US Courses")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingCourseDetail) {
                detailViewIfSelected
            }
            .onChange(of: settings.excludedStates) { oldValue, newValue in
                handleExcludedStatesChange()
            }
        }
    }

    private var mapView: some View {
        Map(position: $cameraPosition, selection: $selectedCourse) {
            ForEach(filteredCourses) { course in
                Marker(coordinate: course.location) {
                    Image(systemName: "flag.circle.fill")
                        .foregroundStyle(.white, .black)
                        .font(.title2)
                }
                .tag(course)
            }
        }
        .mapStyle(.standard)
        .mapControls {
            MapCompass()
            MapScaleView()
        }
        .clipShape(RoundedCorners(radius: 20, corners: [.topLeft, .topRight]))
        .ignoresSafeArea(edges: .bottom)
    }

    private var coursePreviewCardIfSelected: some View {
        Group {
            if let course = selectedCourse {
                CoursePreviewCard(course: course, showDetail: $showingCourseDetail)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .transition(.move(edge: .bottom))
            }
        }
    }

    private var detailViewIfSelected: some View {
        Group {
            if let course = selectedCourse {
                CourseDetailView(course: course)
            }
        }
    }

    private func handleExcludedStatesChange() {
        if let selected = selectedCourse, settings.excludedStates.contains(selected.state) {
            selectedCourse = nil
        }
    }
}

struct CoursePreviewCard: View {
    let course: Course
    @Binding var showDetail: Bool
    @EnvironmentObject var tripManager: TripManager
    @State private var isAdded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("#\(course.rank). \(course.name)")
                    .font(.headline)
                Spacer()
                Button {
                    showDetail = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
            }
            
            Text(course.description)
                .font(.subheadline)
                .lineLimit(2)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Designer: \(course.designer)")
                        .font(.caption)
                    Text("Year Built: \(course.yearBuilt)")
                        .font(.caption)
                }
                .foregroundStyle(.secondary)
                
                Spacer()
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        isAdded = true
                        tripManager.addCourse(course)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isAdded = false
                        }
                    }
                } label: {
                    Label(
                        isAdded ? "Added" : "Add to Trip",
                        systemImage: isAdded ? "checkmark.circle.fill" : "plus.circle.fill"
                    )
                    .scaleEffect(isAdded ? 1.1 : 1.0)
                }
                .buttonStyle(.borderedProminent)
                .tint(isAdded ? .green.opacity(0.8) : .green)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 5, y: 2)
    }
}

struct CourseDetailView: View {
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
                }
                
                Section("Description") {
                    Text(course.description)
                }
                
                Section {
                    Button("Add to Trip") {
                        tripManager.addCourse(course)
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
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

#Preview {
    NavigationStack {
        CourseMapView()
            .environmentObject(TripManager())
            .environmentObject(Settings())
    }
} 
