//
//  InfoCardView.swift
//  CryptoApp
////
import SwiftUI

struct InfoCardView: View {
    let title: String
    let value: String
    let customColor: Color?
    
    @Environment(\.colorScheme) var colorScheme
    
    var defaultTextColor: Color {
        colorScheme == .light ? .black : .white
    }
    
    init(title: String, value: String, color: Color? = nil) {
        self.title = title
        self.value = value
        self.customColor = color
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption)
                .foregroundColor(defaultTextColor.opacity(0.8))
                .lineLimit(1)
            
            Text(value)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(customColor ?? defaultTextColor)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 120, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(UIColor.secondarySystemBackground), Color(UIColor.systemBackground)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}
