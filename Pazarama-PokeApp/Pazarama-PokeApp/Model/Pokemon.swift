//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

struct Pokemon: Codable {
    var results: [PokemonResult]
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String
    let url: String
    var imageUrl : String?
}

var baseArray : [PokemonResult] = []
var shownArray : [PokemonResult] = []
