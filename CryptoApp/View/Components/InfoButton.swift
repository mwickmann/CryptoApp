//
//  InfoButton.swift
//  CryptoApp
//
//

import SwiftUI


struct InfoButton: View {
    let selectedCryptos: Set<String>
    let viewModel: TickersViewModel
    @Binding var selectedTicker: CryptoTicker?
    @Binding var navigateToDetail: Bool

    var body: some View {
        Button("VIS") {
            if let crypto = selectedCryptos.first,
               let ticker = findTicker(for: crypto, in: viewModel.tickers) {
                selectedTicker = ticker
                navigateToDetail = true
            }
        }
        .fontWeight(.light)
        .frame(width: 250, height: 50)
        .background(Color.gray.opacity(0.5))
        .foregroundColor(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

func findTicker(for crypto: String, in tickers: [CryptoTicker]) -> CryptoTicker? {
    return tickers.first {
        $0.name == crypto || ($0.name == "XRP" && crypto == "Ripple")
    }
}
