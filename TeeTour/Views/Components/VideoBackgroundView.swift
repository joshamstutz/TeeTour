import SwiftUI
import AVKit

struct VideoBackgroundView: View {
    @State private var isVideoFinished = false
    private let player: AVPlayer
    private let backgroundColor = Color(hex: "#425d71")
    
    init() {
        // Get the video URL from your bundle
        guard let url = Bundle.main.url(forResource: "background", withExtension: "mp4") else {
            fatalError("Failed to find video file")
        }
        
        // Create player
        let tempPlayer = AVPlayer(url: url)
        tempPlayer.isMuted = true
        self.player = tempPlayer
        
        // Setup notification after player is initialized
        setupNotification()
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                isVideoFinished = true
            }
        }
    }
    
    var body: some View {
        ZStack {
            if !isVideoFinished {
                VideoPlayer(player: player)
                    .disabled(true) // Prevent user interaction
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
            }
            
            backgroundColor
                .opacity(isVideoFinished ? 1 : 0)
        }
        .ignoresSafeArea()
    }
}

// Add Color extension for hex support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
} 