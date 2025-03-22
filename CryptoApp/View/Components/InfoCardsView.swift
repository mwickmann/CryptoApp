//
//  InfoCardView.swift
//  CryptoApp
//
//

import SwiftUI

struct InfoCardsView: View {
    let title: String
    let value: String
    var isBold: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            Text(value)
                .font(isBold ? .title : .body)
                .bold(isBold)
        }
        .infoCardStyle()
    }
}
