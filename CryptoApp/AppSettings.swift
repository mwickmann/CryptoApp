//
//  AppSettings.swift
//  CryptoApp
//
//

import SwiftUI

class AppSettings: ObservableObject {
    @Published var displayInNOK: Bool = false
    @Published var conversionRate: Double = 10.5
    @Published var emojiThreshold: Double = 5.0

    
    // Konverterer USD til NOK hvis aktivert
    func convertToPreferredCurrency(priceUSD: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if displayInNOK {
            let nokPrice = priceUSD * conversionRate
            formatter.currencyCode = "NOK"
            return formatter.string(from: NSNumber(value: nokPrice)) ?? "kr0.00"
        } else {
            formatter.currencyCode = "USD"
            return formatter.string(from: NSNumber(value: priceUSD)) ?? "$0.00"
        }
    }
    
    func saveToUserDefaults() {
        UserDefaults.standard.set(displayInNOK, forKey: "displayInNOK")
        UserDefaults.standard.set(conversionRate, forKey: "conversionRate")
    }
    
    // Henter verdier fra UserDefaults
    func loadFromUserDefaults() {
        if UserDefaults.standard.object(forKey: "displayInNOK") != nil {
            displayInNOK = UserDefaults.standard.bool(forKey: "displayInNOK")
        }
        if let rate = UserDefaults.standard.value(forKey: "conversionRate") as? Double {
            conversionRate = rate
        }
    }
}
