//
//  ContentView.swift
//  TeeTour
//
//  Created by Josh Amstutz on 2/25/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tripManager = TripManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Video background
                VideoBackgroundView()
                    .opacity(0.7) // Adjust this value to control video visibility
                
                // Semi-transparent overlay to ensure content visibility
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                
                // Your existing content
                VStack(spacing: 30) {
                    // Logo/Icon
                    Circle()
                        .fill(.ultraThinMaterial) // Changed to material for better contrast
                        .frame(width: 120, height: 120)
                        .overlay {
                            Image(systemName: "flag")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(30)
                                .foregroundStyle(.white) // Changed to white
                        }
                        .shadow(radius: 100)
                    
                    // Title
                    Text("TeeTour")
                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white) // Changed to white
                    
                    // Menu Options
                    VStack(spacing: 16) {
                        NavigationLink(destination: CourseMapView()) {
                            MenuButton(
                                title: "Explore Courses",
                                icon: "map",
                                color: .white.opacity(0.7)
                            )
                        }
                        
                        NavigationLink(destination: SelectedCoursesView()) {
                            MenuButton(
                                title: "Selected Courses",
                                icon: "checkmark.circle",
                                color: .white.opacity(0.7)
                            )
                        }
                        
                        NavigationLink(destination: TripsView()) {
                            MenuButton(
                                title: "Trips",
                                icon: "airplane",
                                color: .white.opacity(0.7)
                            )
                        }
                    }
                    .padding(.top, 30)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.trailing, 30)
                    }
                }
            }
        }
        .environmentObject(tripManager)
    }
}

struct MenuButton: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.black)
        .padding()
        .frame(maxWidth: .infinity)
        .background(color.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 100)
    }
}

#Preview {
    ContentView()
        .environmentObject(TripManager())
        .environmentObject(Settings())
}
