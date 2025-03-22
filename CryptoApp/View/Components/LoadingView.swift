//
//  LoadingView.swift
//  CryptoApp
//
//

import SwiftUI

struct LoadingView: View {
    let fetchAction: () async -> Void
    
    var body: some View {
        ProgressView("Laster data...")
            .onAppear {
                Task {
                    await fetchAction()
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
