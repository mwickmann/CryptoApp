//
//  ViewModifiers.swift
//  CryptoApp
//
//

import SwiftUI

extension View {
    func infoCardStyle() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(12)
    }
}
