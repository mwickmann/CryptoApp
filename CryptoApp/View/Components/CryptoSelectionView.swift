//
//  CryptoSelectionView.swift
//  CryptoApp
//
//

import Foundation
import SwiftUI

struct CryptoSelectionView: View {
    let cryptoOptions: [String]
    @Binding var selectedCryptos: Set<String>
    var updateAction: (String) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(cryptoOptions, id: \.self) { crypto in
                    GlowingButton(title: crypto, isSelected: selectedCryptos.contains(crypto)) {
                        updateAction(crypto)
                    }
                    .frame(minWidth: 100, minHeight: 50)
                }
            }
            .padding(.horizontal)
        }
    }
}
