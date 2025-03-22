//
//  CryptoViewModel.swift
//  CryptoApp
//
//

import SwiftUI

@MainActor
class CryptoViewModel: ObservableObject {
    @Published var globalData: CryptoData?
    @Published var lastUpdated: Date?
    @Published var errorMessage: String?
    
    private let networkMonitor = NetworkMonitor()
    private let cryptoService = CryptoService()

    func fetchGlobalData() async {
        if !networkMonitor.isConnected {
            self.errorMessage = "Ingen internettforbindelse"
            return
        }

        do {
            let data = try await cryptoService.fetchGlobalData()
            self.globalData = data
            self.lastUpdated = Date()
            self.errorMessage = nil
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
