//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

struct Pokemon: Codable {
    let results: [PokemonResult]
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String
    let url: String
    let imageUrl : String?
}
