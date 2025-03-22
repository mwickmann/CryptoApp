//
//  FormatPrice.swift
//  CryptoApp
//
//

import Foundation

func formatPrice(_ price: Double, using settings: AppSettings) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    if settings.displayInNOK {
        let nokPrice = price * settings.conversionRate
        formatter.currencyCode = "NOK"
        return formatter.string(from: NSNumber(value: nokPrice)) ?? "kr0.00"
    } else {
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: price)) ?? "$0.00"
    }
}
