//
//  MovieDetail.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 6.11.2023.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let title, year: String
    let runtime, genre, director, writer: String
    let actors, plot: String
    let poster: String
    let imdbRating, imdbID: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating
        case imdbID
    }
}
