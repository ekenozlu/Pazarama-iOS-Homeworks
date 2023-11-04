//
//  PokemonDetails.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

struct PokemonDetails: Codable {
    let abilities : [Abilities]
    let height: Int
    let id: Int
    let name: String
    let species: PokemonNameUrlModel
    let sprites: Sprites
    let stats: [Stats]
    let types: [PokemonTypes]
    let weight: Int
}
// Sadece name
struct Abilities: Codable {
    let ability: PokemonNameUrlModel
}
struct Stats: Codable {
    let baseStat: Int
    let stat: PokemonNameUrlModel
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}
// Sadece name
struct PokemonTypes: Codable {
    let type: PokemonNameUrlModel
}
struct Species: Codable {
    let flavorTextEntries: [FlavorTextEntries]
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}
struct FlavorTextEntries: Codable {
    let flavorText: String?
    let language: PokemonNameUrlModel?
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct PokemonImage: Codable {
    let officialArtwork: FrontDefaults
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Sprites: Codable {
    let other: PokemonImage
}

struct FrontDefaults: Codable {
    let frontDefault: String
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
struct PokemonNameUrlModel: Codable {
    let name: String
    let url: String
}
