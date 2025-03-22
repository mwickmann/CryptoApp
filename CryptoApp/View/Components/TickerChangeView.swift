//
//  TickerChangeView.swift
//  CryptoApp
//
//

import SwiftUI

struct TickerChangeView: View {
    let title: String
    let change: Double

    var body: some View {
        HStack {
            Text("\(title):")
                .font(.subheadline)
            Spacer()
            Text("\(String(format: "%.1f", change))%")
                .font(.subheadline)
                .foregroundColor(change >= 0 ? .green : .red)
        }
    }
}
