//
//  CryptoTicker.swift
//  CryptoApp
//
//

import Foundation

struct TickerResponse: Codable {
    let data: [CryptoTicker]
}

struct CryptoTicker: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let nameid: String
    let rank: Int
    let price_usd: String
    let percent_change_24h: String?
    let percent_change_1h: String?
    let percent_change_7d: String?
    let price_btc: String
    let market_cap_usd: String
    let volume24: Double
    let volume24a: Double
    let csupply: String
    let tsupply: String
    let msupply: String?
    
    var priceUSD: Double {
        Double(price_usd) ?? 0.0
    }
    
    var change1h: Double {
        Double(percent_change_1h ?? "0") ?? 0.0
    }
    
    var change24h: Double {
        Double(percent_change_24h ?? "0") ?? 0.0
    }
    
    var change7d: Double {
        Double(percent_change_7d ?? "0") ?? 0.0
    }
}

