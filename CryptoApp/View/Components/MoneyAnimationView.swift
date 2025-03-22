//
//  MoneyAnimationView.swift
//  CryptoApp
//

import SwiftUI

struct MoneyAnimationView: View {
    @State private var emojis: [MoneyEmoji] = []
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(emojis) { emoji in
                    Text("💰")
                        .font(.largeTitle)
                        .position(x: emoji.x, y: emoji.y)
                        .opacity(emoji.opacity)
                }
            }
            .onAppear {
                emojis = (0..<10).map { _ in
                    MoneyEmoji(
                        id: UUID(),
                        x: Double.random(in: 0...geo.size.width),
                        y: -50, // Starter over skjermen
                        opacity: 1.0
                    )
                }
                withAnimation(.linear(duration: 3)) {
                    for index in emojis.indices {
                        emojis[index].y = geo.size.height + 50
                        emojis[index].opacity = 0.0
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct MoneyEmoji: Identifiable {
    let id: UUID
    var x: Double
    var y: Double
    var opacity: Double
}


