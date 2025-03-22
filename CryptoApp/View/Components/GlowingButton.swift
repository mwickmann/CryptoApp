import SwiftUI

struct GlowingButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.purple]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    var body: some View {
        Button(action: action) {
            Text(title.uppercased())
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? Color.white.opacity(0.8) : Color.primary.opacity(0.7))
                .shadow(
                    color: (isSelected ? Color.blue : Color.gray).opacity(0.5),
                    radius: 4,
                    x: 0,
                    y: 0
                )
                .padding(.vertical, 18)
                .padding(.horizontal, 30)
                .background {
                    if isSelected {
                        gradient
                    } else {
                        Color.clear
                    }
                }
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(gradient, lineWidth: 2)
                        .shadow(
                            color: (isSelected ? Color.blue : Color.gray).opacity(0.5),
                            radius: 4,
                            x: 0,
                            y: 0
                        )
                )
        }
    }
}
