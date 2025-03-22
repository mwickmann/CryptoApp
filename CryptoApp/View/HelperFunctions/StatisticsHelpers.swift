//
//  StatisticsHelpers.swift
//  CryptoApp
//
//

import Foundation
import SwiftUI

func filterAndMapTickers(_ tickers: [CryptoTicker], selectedCryptos: Set<String>, defaultCryptoSet: [String]) -> [CryptoStatistics] {
    tickers
        .filter { ticker in
            if selectedCryptos.isEmpty || selectedCryptos.contains("All") {
                return defaultCryptoSet.contains(ticker.name) || ticker.name == "XRP"
            }
            if selectedCryptos.contains("Ripple") && (ticker.name == "Ripple" || ticker.name == "XRP") {
                return true
            }
            return selectedCryptos.contains(ticker.name)
        }
        .flatMap { ticker in
            let displayName = (ticker.name == "XRP") ? "Ripple" : ticker.name
            return [
                CryptoStatistics(cryptoName: displayName, period: "1h", change: ticker.change1h, priceUSD: ticker.priceUSD),
                CryptoStatistics(cryptoName: displayName, period: "24h", change: ticker.change24h, priceUSD: ticker.priceUSD),
                CryptoStatistics(cryptoName: displayName, period: "7d", change: ticker.change7d, priceUSD: ticker.priceUSD)
            ]
        }
}

func calculateYDomain(stats: [CryptoStatistics]) -> ClosedRange<Double> {
    let minChange = stats.map { $0.change }.min() ?? -10
    let maxChange = stats.map { $0.change }.max() ?? 10
    let margin = 1.0

    let adjustedMin = min(minChange - margin, -10)
    let adjustedMax = max(maxChange + margin, 10)

    return adjustedMin...adjustedMax
}


func updateSelectedCrypto(for crypto: String, selectedCryptos: inout Set<String>) {
    if crypto == "All" {
        selectedCryptos = ["All"]
    } else {
        if selectedCryptos.contains("All") {
            selectedCryptos.remove("All")
        }
        if selectedCryptos.contains(crypto) {
            selectedCryptos.remove(crypto)
        } else {
            selectedCryptos.insert(crypto)
        }
        if selectedCryptos.isEmpty {
            selectedCryptos = ["All"]
        }
    }
}

func shouldShowInfoButton(selectedCryptos: Set<String>) -> Bool {
    return selectedCryptos.count == 1 && selectedCryptos.first != "All"
}

func animateIfNeeded(stats: [CryptoStatistics], showMoneyAnimation: Binding<Bool>, settings: AppSettings) {
    if stats.contains(where: { abs($0.change) > settings.emojiThreshold }) {
        withAnimation(.easeIn(duration: 0.5)) {
            showMoneyAnimation.wrappedValue = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeOut(duration: 0.5)) {
                showMoneyAnimation.wrappedValue = false
            }
        }
    }
}
