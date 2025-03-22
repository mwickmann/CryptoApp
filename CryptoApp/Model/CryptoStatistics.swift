//
//  CryptoStatistics.swift
//  CryptoApp
//
//

import Foundation

struct CryptoStatistics: Identifiable {
    let id = UUID()
    let cryptoName: String
    let period: String
    let change: Double
    let priceUSD: Double

}

enum CryptoSelection: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case ethereum = "Ethereum"
    case ethereumRipple = "Ethereum + Ripple"
}
