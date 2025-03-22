//
//  TickerRowView.swift
//  CryptoApp
//
//

import SwiftUI

struct TickerRowView: View {
    let ticker: CryptoTicker
    let selectedPeriod: String
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(ticker.rank).")
                .fontWeight(.light)
                .foregroundColor(.gray)
            
            CryptoIconView(symbol: ticker.symbol)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(ticker.name)
                    .font(.headline)
                
                Text(formatPrice(ticker.priceUSD, using: settings))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if let change = ticker.changeValue(for: selectedPeriod) {
                Text("\(String(format: "%.1f", change))%")
                    .font(.subheadline)
                    .foregroundColor(change >= 0 ? .green : .red)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.systemBackground))
                .shadow(radius: 2)
        )
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}
