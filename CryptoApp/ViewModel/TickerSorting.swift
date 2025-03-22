//
//  TickerSorting.swift
//  CryptoApp


import SwiftUI
import Foundation

struct TickerSorting {
    static func sortTickers(_ tickers: [CryptoTicker], by option: TickersViewModel.SortOption, ascending: Bool) -> [CryptoTicker] {
        return tickers.sorted {
            switch option {
            case .rank:
                return ascending ? ($0.rank < $1.rank) : ($0.rank > $1.rank)
            case .change1h:
                return ascending ? ($0.change1h < $1.change1h) : ($0.change1h > $1.change1h)
            case .change24h:
                return ascending ? ($0.change24h < $1.change24h) : ($0.change24h > $1.change24h)
            case .change7d:
                return ascending ? ($0.change7d < $1.change7d) : ($0.change7d > $1.change7d)
            }
        }
    }
}
