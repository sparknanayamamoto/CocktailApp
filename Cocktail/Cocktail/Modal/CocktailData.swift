//
//  Cocktail.swift
//  Cocktail
//
//  Created by spark-04 on 2024/02/29.
//

import Foundation

struct Item: Codable {
    let name: String
    let imageURLs: [String]
}

class CocktailDataParser {
    func getImageURLs(from jsonURL: URL) async throws -> [URL] {
        do {
            let (data, _) = try await URLSession.shared.data(from: jsonURL)
            let cocktailData = try JSONDecoder().decode(CocktailData.self, from: data)
            return cocktailData.imageURLs.map { URL(string: $0)! }
        } catch {
            throw NSError(domain: "Failed toparse JSON.INvalid format.", code: 0, userInfo: nil)
        }
    }
}
