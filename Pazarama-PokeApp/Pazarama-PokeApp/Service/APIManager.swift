//
//  APIManager.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

protocol PokemonService {
    func fetchPokemon(completion: @escaping (Result<Pokemon, NetworkError>) -> ())
    func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetails, NetworkError>) -> ())
    func fetchPokemonSpecies(url: String, completion: @escaping (Result<Species, NetworkError>) -> ())
}

class APIManager: PokemonService {
    
    func fetchPokemon(completion: @escaping (Result<Pokemon, NetworkError>) -> ()) {
        
        if let url = URL(string: BaseUrl.baseUrl + "pokemon") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(.failure(.requestFailed))
                    return
                }
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(.success(pokemon))
                } catch {
                    print("Decoding Error: \(error)")
                    completion(.failure(.decodeError))
                }
            }.resume()
        }
    }
    
    func fetchPokemonDetail(name: String, completion: @escaping (Result<PokemonDetails, NetworkError>) -> ()) {
        
        if let url = URL(string: BaseUrl.baseUrl + "pokemon/\(name)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(.failure(.requestFailed))
                    return
                }
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let pokemonDetail = try JSONDecoder().decode(PokemonDetails.self, from: data)
                    completion(.success(pokemonDetail))
                } catch {
                    print("Decoding Error: \(error)")
                    completion(.failure(.decodeError))
                }
            }.resume()
        }
    }
    
    func fetchPokemonSpecies(url: String, completion: @escaping (Result<Species, NetworkError>) -> ()) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(.failure(.requestFailed))
                    return
                }
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let flavorTextEntries = try JSONDecoder().decode(Species.self, from: data)
                    completion(.success(flavorTextEntries))
                } catch {
                    print("Decoding Error: \(error)")
                    completion(.failure(.decodeError))
                }
            }.resume()
        }
    }
}
