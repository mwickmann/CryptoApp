//
//  CryptoIconsView.swift
//  CryptoApp
//
//

import SwiftUI

struct CryptoIconView: View {
    let symbol: String
    
    var body: some View {
        let imagePath = "cryptoicons/\(symbol.lowercased())"
        return Group {
            if let uiImage = UIImage(named: imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .foregroundColor(.gray)
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
