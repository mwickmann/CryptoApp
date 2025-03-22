//
//  APIError.swift
//  CryptoApp
//
//

import Foundation


enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case noDataFound

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Ugyldig URL. Vennligst sjekk adressen."
        case .invalidResponse:
            return "Ugyldig respons fra serveren."
        case .invalidData:
            return "Kunne ikke lese dataene fra serveren."
        case .unableToComplete:
            return "Kan ikke fullføre forespørselen. Sjekk nettverkstilkoblingen."
        case .noDataFound:
            return "Ingen data funnet."
        }
    }
}
