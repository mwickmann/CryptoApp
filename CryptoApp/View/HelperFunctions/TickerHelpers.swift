//
//  TickerHelpers.swift
//  CryptoApp
//
//


// Disse hjelpefunksjonene er for å sortere tickers - asc eller desc + sortere etter endring siste time, døgnet og uken
import Foundation

func sortTickers(_ tickers: [CryptoTicker], by option: TickersViewModel.SortOption, ascending: Bool) -> [CryptoTicker] {
    tickers.sorted { lhs, rhs in
        let lhsValue = sortKey(lhs, option: option)
        let rhsValue = sortKey(rhs, option: option)
        return ascending ? lhsValue < rhsValue : lhsValue > rhsValue
    }
}

func sortKey(_ ticker: CryptoTicker, option: TickersViewModel.SortOption) -> Double {
    switch option {
    case .rank:
        return Double(ticker.rank)
    case .change1h:
        return ticker.change1h
    case .change24h:
        return ticker.change24h
    case .change7d:
        return ticker.change7d
    }
}


func filterTickers(_ tickers: [CryptoTicker], by searchText: String) -> [CryptoTicker] {
    searchText.isEmpty ? tickers : tickers.filter {
        $0.name.localizedCaseInsensitiveContains(searchText)
    }
}

