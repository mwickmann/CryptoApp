//
//  CryptoView.swift
//  CryptoApp
//
//

import SwiftUI


struct CryptoView: View {
    @StateObject var viewModel = CryptoViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                GreetingView()
                InfoBoxView()
                
                if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage)
                } else if let data = viewModel.globalData {
                    GlobalDataView(data: data, lastUpdated: viewModel.lastUpdated)
                        .refreshable {
                            await viewModel.fetchGlobalData()
                        }
                } else {
                    LoadingView(fetchAction: {
                        await viewModel.fetchGlobalData()
                    })
                }
                Spacer()
            }
        }
    }
}
