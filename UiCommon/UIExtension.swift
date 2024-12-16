//
//  UIExtension.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 30.11.2024.
//

import SwiftUI

// MARK: - Custom Font Enum
enum Inter: String {
    case regular = "Inter_18pt-SemiBold"
    case medium = "Inter_24pt-Medium"
    case semibold = "Inter_24pt-Regular"
    case bold = "Roboto-Bold"
}

// MARK: - Font Extension
extension Font {
    static func customfont(_ font: Inter, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

// MARK: - CGFloat Extension
extension CGFloat {
    static var screenWidth: Double {
        UIScreen.main.bounds.size.width
    }

    static var screenHeight: Double {
        UIScreen.main.bounds.size.height
    }

    static func widthPer(per: Double) -> Double {
        screenWidth * per
    }

    static func heightPer(per: Double) -> Double {
        screenHeight * per
    }

    static var topInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return Double(keyWindow.safeAreaInsets.top)
    }

    static var bottomInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return Double(keyWindow.safeAreaInsets.bottom)
    }

    static var horizontalInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return Double(keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right)
    }

    static var verticalInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return Double(keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom)
    }
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
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
            (a, r, g, b) = (255, 255, 255, 0) // Default to white color
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

struct ShowButton: ViewModifier {
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack{
            content
            Button{
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.black)
            }
        }
    }
}
