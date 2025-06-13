//
//  ContentView.swift
//  DasherHomeTest
//
//  Created by Akhil Dakinedi on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            // Map background
            Image("MapView 3")
                .resizable()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top Nav
                HStack {
                    // Menu Button
                    IconButton(icon: "menu", isSystem: false)
                    Spacer()
                    HStack(spacing: 8) {
                        // Notification Button
                        IconButton(icon: "notifications", hasBadge: false, isSystem: false)
                        // Messages Button
                        IconButton(icon: "chat", isSystem: false)
                    }
                }
                .overlay(
                    // Earnings Pill
                    VStack(alignment: .center, spacing: 4) {
                        Text("$42.60")
                            .font(.custom("TTNorms-Bold", size: 18))
                            .foregroundColor(Color(hex: "#191919"))
                        Text("This week")
                            .font(.custom("TTNorms-Medium", size: 14))
                            .foregroundColor(Color(hex: "#606060"))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.white).shadow(color: Color.black.opacity(0.2), radius: 8, y: 2))
                )
                .padding(.horizontal, 16)
                .padding(.top, 8)

                Spacer()

                // Floating Action Bar
                HStack {
                    // TimeModeButton
                    IconButton(icon: "hourglass-off-line", isSystem: false)
                    Spacer()
                    // Safety Button
                    IconButton(icon: "safety", isSystem: false)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)

                // Sheet Container
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("IL: River North / Loop")
                            .font(.custom("TTNorms-Medium", size: 18))
                            .foregroundColor(Color(hex: "#606060"))
                        Text("Stay busy with lots of offers")
                            .font(.custom("TTNorms-Bold", size: 40))
                            .tracking(-2)
                            .foregroundColor(Color(hex: "#191919"))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    // Body
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Avg. offer wait")
                                    .font(.custom("TTNorms-Medium", size: 18))
                                    .foregroundColor(Color(hex: "#606060"))
                                Text("4 min")
                                    .font(.custom("TTNorms-Medium", size: 20))
                                    .foregroundColor(Color(hex: "#191919"))
                            }
                            Spacer()
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#d6d6d6")))
                        .padding(.horizontal, 16)
                    }
                    .padding(.vertical, 8)
                    // Footer
                    HStack(spacing: 8) {
                        Button(action: {}) {
                            Text("Dash")
                                .font(.custom("TTNorms-Bold", size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                        }
                        .background(Capsule().fill(Color(hex: "#eb1700")))
                        .frame(height: 56)
                        Button(action: {}) {
                            Image("schedule")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(hex: "#191919"))
                        }
                        .frame(width: 56, height: 56)
                        .background(Circle().fill(Color(hex: "#f1f1f1")))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
                .background(
                    RoundedCorner(radius: 24, corners: [.topLeft, .topRight])
                        .fill(Color.white)
                )
                .compositingGroup()
                .shadow(color: Color.black.opacity(0.2), radius: 16, y: 4)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// Helper Views
struct MapRegion: Shape {
    let path: String
    
    func path(in rect: CGRect) -> Path {
        // Convert SVG path to SwiftUI Path
        // This is a simplified version - you'll need to implement proper SVG path parsing
        Path { path in
            // Add path drawing logic here
        }
    }
}

struct CurrentLocationPin: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(hex: "#4969F5").opacity(0.2))
                .frame(width: 48, height: 48)
            Circle()
                .fill(Color(hex: "#4969F5"))
                .frame(width: 22, height: 22)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
        }
    }
}

struct BusyPin: View {
    let text: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Capsule().fill(color))
                .shadow(color: color.opacity(0.4), radius: 8, y: 2)
            Triangle()
                .fill(color)
                .frame(width: 21, height: 14)
                .offset(y: -5)
        }
    }
}

struct OfferPin: View {
    let text: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Capsule().fill(color))
                .shadow(color: color.opacity(0.4), radius: 8, y: 2)
            Triangle()
                .fill(color)
                .frame(width: 21, height: 14)
                .offset(y: -5)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct IconButton: View {
    let icon: String
    var hasBadge: Bool = false
    var isSystem: Bool = true
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Circle()
                .fill(Color.white)
                .frame(width: 56, height: 56)
                .shadow(color: Color.black.opacity(0.2), radius: 8, y: 2)
                .overlay(
                    Group {
                        if isSystem {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(hex: "#191919"))
                        } else {
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(hex: "#191919"))
                        }
                    }
                )
            if hasBadge {
                Circle()
                    .fill(Color(hex: "#EB1700"))
                    .frame(width: 12, height: 12)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .offset(x: 12, y: -6)
            }
        }
    }
}

// Helper for hex colors
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
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
}
