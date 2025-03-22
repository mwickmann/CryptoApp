//
//  TickerFetcher.swift
//  CryptoApp
////

import SwiftUI
import Foundation

struct TickerFetcher {
    static func fetchTickers() async -> [CryptoTicker] {
        let urlString = "https://api.coinlore.net/api/tickers/"
        guard let url = URL(string: urlString) else { return [] }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let tickerResponse = try JSONDecoder().decode(TickerResponse.self, from: data)
            return tickerResponse.data.sorted { $0.rank < $1.rank }
        } catch {
            print("Feil ved henting av data: \(error)")
            return []
        }
    }
}
