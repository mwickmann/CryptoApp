//
//  StatisticsHeaderView.swift
//  CryptoApp
//
//

import SwiftUI

struct StatisticsHeaderView: View {
    let selectedCryptos: Set<String>
    let firstTicker: CryptoTicker?
    let settings: AppSettings

    var body: some View {
        VStack(spacing: 4) {
            Text("Endringer siste time, døgn & uke")
                .font(.headline)
            Text("Valgt: \(selectedCryptos.sorted().joined(separator: ", "))")
                .font(.subheadline)
                .foregroundColor(.secondary)
         
        }
        .padding(.top)
    }
}
