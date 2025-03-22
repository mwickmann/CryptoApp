//
//  TickerService.swift
//  CryptoApp
//
//

import Foundation

struct TickerService {
    static func fetchTickers() async throws -> [CryptoTicker] {
        let urlString = "https://api.coinlore.net/api/tickers/"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let tickerResponse = try JSONDecoder().decode(TickerResponse.self, from: data)
            return tickerResponse.data.sorted { $0.rank < $1.rank }
        } catch {
            throw error
        }
    }
}
