import SwiftUI

struct TripsView: View {
    @EnvironmentObject var tripManager: TripManager
    @State private var expandedTrips: Set<UUID> = []
    
    var body: some View {
        List {
            ForEach(tripManager.trips) { trip in
                Section {
                    // Courses
                    ForEach(trip.courses) { course in
                        NavigationLink(destination: CourseDetailView(course: course)) {
                            VStack(alignment: .leading) {
                                Text(course.name)
                                    .font(.headline)
                                Text(course.designer)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    // Action Buttons
                    HStack {
                        NavigationLink(destination: TripPlanningView(trip: trip)) {
                            Label("Plan Trip", systemImage: "airplane.departure")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top, 8)
                    
                    Button(role: .destructive) {
                        withAnimation {
                            tripManager.ungroupTrip(trip)
                        }
                    } label: {
                        Label("Delete Trip", systemImage: "folder.badge.minus")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(10)
                    }
                    .padding(.top, 4)
                } header: {
                    HStack {
                        Text(trip.name)
                            .font(.headline)
                        Spacer()
                        Text("\(trip.courses.count) courses")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("My Trips")
        .overlay {
            if tripManager.trips.isEmpty {
                ContentUnavailableView(
                    "No Trips",
                    systemImage: "bag.badge.minus",
                    description: Text("Create a trip from your selected courses")
                )
            }
        }
    }
}

struct TripDetailView: View {
    let trip: Trip
    @EnvironmentObject private var tripManager: TripManager
    @State private var showingCourseDetail = false
    
    var body: some View {
        List {
            Section {
                ForEach(trip.courses) { course in
                    NavigationLink(destination: CourseDetailView(course: course)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("#\(course.rank). \(course.name)")
                                .font(.headline)
                            Text(course.designer)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            } header: {
                Text("Courses")
            }
            
            Section {
                Button {
                    showingCourseDetail = true
                } label: {
                    HStack {
                        Image(systemName: "airplane.departure")
                        Text("Plan My Trip")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.green)
                }
                
                Button(role: .destructive) {
                    tripManager.ungroupTrip(trip)
                } label: {
                    HStack {
                        Image(systemName: "folder.badge.minus")
                        Text("Delete Trip")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
            } header: {
                Text("Trip Actions")
            }
        }
        .navigationTitle(trip.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingCourseDetail) {
            TripPlanningView(trip: trip)
        }
    }
} 
