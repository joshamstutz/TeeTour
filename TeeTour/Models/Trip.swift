import Foundation

struct Trip: Identifiable {
    let id = UUID()
    var name: String
    var courses: [Course]
    var dateCreated: Date
} 