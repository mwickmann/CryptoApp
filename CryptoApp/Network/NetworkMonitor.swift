//
//  NetworkMonitor.swift
//  CryptoApp
//
//

import Foundation
import Network
import SwiftUI


// Sjekker direkte opp mot om bruker har internett
class NetworkMonitor: ObservableObject {
    @Published var isConnected = true
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
