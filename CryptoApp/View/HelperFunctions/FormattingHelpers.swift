//
//  FormattingHelpers.swift
//  CryptoApp
//
//  Created by Mari Wickmann on 24/02/2025.
//

import SwiftUI

struct FormattingHelpers {
    static func formatMarketCap(_ value: Double) -> String {
        if value >= 1_000_000_000_000 {
            return String(format: "%.2f T USD", value / 1_000_000_000_000)
        } else if value >= 1_000_000_000 {
            return String(format: "%.2f B USD", value / 1_000_000_000)
        } else {
            return String(format: "%.2f M USD", value / 1_000_000)
        }
    }
    
    static func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    static func marketChangeColor(_ value: String) -> Color {
        if let doubleValue = Double(value), doubleValue < 0 {
            return .red
        }
        return .green
    }
}
