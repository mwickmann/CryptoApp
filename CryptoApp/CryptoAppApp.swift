//
//  CryptoAppApp.swift
//  CryptoApp

import SwiftUI


@main
struct CryptoAppApp: App {
    @StateObject private var settings = AppSettings()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false 
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                TabView {
                    CryptoView()
                        .tabItem {
                            Label("Hjem", systemImage: "house")
                        }
                    TickersListView()
                        .tabItem {
                            Label("Kryptovalutaer", systemImage: "bitcoinsign.circle")
                        }
                    StatisticsView()
                        .tabItem {
                            Label("Statistikk", systemImage: "chart.bar.xaxis")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Innstillinger", systemImage: "gear")
                        }
                }
                .environmentObject(settings)
            } else {
                OnboardingView()
            }
        }
    }
}
