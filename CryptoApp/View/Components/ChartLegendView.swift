//
//  ChartLegendView.swift
//  CryptoApp
//
//

import SwiftUI

struct ChartLegendView: View {
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 4) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 16, height: 16)
                Text("1h")
                    .font(.caption)
            }
            HStack(spacing: 4) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.gray)
                    .frame(width: 16, height: 16)
                Text("24h")
                    .font(.caption)
            }
            HStack(spacing: 4) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.purple)
                    .frame(width: 16, height: 16)
                Text("7d")
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
    }
}
