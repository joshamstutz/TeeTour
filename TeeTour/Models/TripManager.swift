import Foundation
import SwiftUI

class TripManager: ObservableObject {
    @Published var selectedCourses: [Course] = []
    @Published var trips: [Trip] = []
    
    func addCourse(_ course: Course) {
        guard !selectedCourses.contains(where: { $0.id == course.id }) else { return };        selectedCourses.append(course)
    }
    
    func removeCourse(_ course: Course) {
        selectedCourses.removeAll { $0.id == course.id }
    }
    
    func createTrip(name: String, courses: [Course]) {
        let newTrip = Trip(name: name, courses: courses, dateCreated: Date())
        trips.append(newTrip)
        // Remove grouped courses from selectedCourses
        for course in courses {
            removeCourse(course)
        }
    }
    
    func ungroupTrip(_ trip: Trip) {
        // First add the courses back to selected courses
        selectedCourses.append(contentsOf: trip.courses)
        
        // Then remove the trip
        trips.removeAll { $0.id == trip.id }
    }
} 
