//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

protocol PokemonViewModelOutPut: AnyObject{
    func getPokemon(_ pokemon: Pokemon)
}

final class PokemonViewModel {
    
    // Dependency Injection
    private let pokemonService: PokemonService
    
    // Delegate Pattern
    weak var output: PokemonViewModelOutPut?
    
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
    
    func fetchPokemon() {
        pokemonService.fetchPokemon { [weak self] result in
            switch result {
            case .success(let fetchedPokemon):
                self?.output?.getPokemon(fetchedPokemon)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
