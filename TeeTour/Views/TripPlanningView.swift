import SwiftUI

struct TripPlanningView: View {
    let trip: Trip
    
    var body: some View {
        VStack {
            Text("Trip Planning")
                .font(.title)
                .padding()
            
            Text("Flight information coming soon...")
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .navigationTitle(trip.name)
        .navigationBarTitleDisplayMode(.inline)
    }
} 