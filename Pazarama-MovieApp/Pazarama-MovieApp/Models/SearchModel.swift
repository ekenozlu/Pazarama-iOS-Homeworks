//
//  SearchModel.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let search: [Movie]?
    let totalResults, response, error: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

// MARK: - Search
struct Movie: Codable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

