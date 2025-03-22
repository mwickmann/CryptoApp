//
//  TickerDetailView.swift
//  CryptoApp
//
//
import SwiftUI

struct TickerDetailsView: View {
    let ticker: CryptoTicker

    var body: some View {
        VStack {
            Text(ticker.name)
                .font(.largeTitle)
                .bold()
            
            Text("Pris: \(ticker.priceUSD, specifier: "%.2f") USD")
                .font(.title2)

            Text("Rank: \(ticker.rank)")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)

    }
}
