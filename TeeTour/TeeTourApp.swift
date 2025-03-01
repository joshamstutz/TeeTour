//
//  TeeTourApp.swift
//  TeeTour
//
//  Created by Josh Amstutz on 2/25/25.
//

import SwiftUI

@main
struct TeeTourApp: App {
    @StateObject private var tripManager = TripManager()
    @StateObject private var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tripManager)
                .environmentObject(settings)
        }
    }
}
