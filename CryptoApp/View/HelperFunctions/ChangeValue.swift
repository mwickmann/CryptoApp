//
//  CryptoTicker.swift
//  CryptoApp
//
//

import Foundation

extension CryptoTicker {
    func changeValue(for period: String) -> Double? {
        switch period {
        case "1h":
            return Double(self.percent_change_1h ?? "") ?? 0
        case "24h":
            return Double(self.percent_change_24h ?? "") ?? 0
        case "7d":
            return Double(self.percent_change_7d ?? "") ?? 0
        default:
            return nil
        }
    }
}
