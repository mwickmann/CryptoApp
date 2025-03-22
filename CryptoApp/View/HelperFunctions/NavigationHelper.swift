//
//  NavigationHelper.swift
//  CryptoApp
//
//

import SwiftUI

func navigationDestinationView(navigateToDetail: Binding<Bool>, selectedTicker: CryptoTicker?) -> some View {
    EmptyView()
        .navigationDestination(isPresented: navigateToDetail) {
            if let ticker = selectedTicker {
                TickerDetailView(ticker: ticker)
            } else {
                EmptyView()
            }
        }
}
