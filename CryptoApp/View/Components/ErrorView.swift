//
//  ErrorView.swift
//  CryptoApp
//
//
import SwiftUI

struct ErrorView: View {
    let message: String
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Image(systemName: "wifi.exclamationmark")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Text(message)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
