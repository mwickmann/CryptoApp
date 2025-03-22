//
//  CryptoService.swift
//  CryptoApp
//
//

import Foundation

struct CryptoService {
    let apiURL = "https://api.coinlore.net/api/global/"

    func fetchGlobalData() async throws -> CryptoData {
        guard let url = URL(string: apiURL) else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        let decodedData = try JSONDecoder().decode([CryptoData].self, from: data)

        guard let firstData = decodedData.first else {
            throw APIError.noDataFound
        }

        return firstData
    }
}
