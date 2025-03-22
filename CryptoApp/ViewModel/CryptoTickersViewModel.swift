//
//  CryptoTickersViewModel.swift
//  CryptoGlobal
//
//
import SwiftUI

class TickersViewModel: ObservableObject {
    @Published var tickers: [CryptoTicker] = []
    @Published var sortOption: SortOption = .rank
    @Published var sortAscending: Bool = true

    enum SortOption {
        case rank, change1h, change24h, change7d
    }

    @MainActor
    func fetchTickers() async {
        do {
            self.tickers = try await TickerService.fetchTickers()
        } catch {
            print("Feil ved henting av data: \(error)")
        }
    }

    func sortTickers() {
        self.tickers = TickerSorting.sortTickers(tickers, by: sortOption, ascending: sortAscending)
    }
}
