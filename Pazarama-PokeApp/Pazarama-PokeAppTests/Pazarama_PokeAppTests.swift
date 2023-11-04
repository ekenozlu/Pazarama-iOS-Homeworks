//
//  Pazarama_PokeAppTests.swift
//  Pazarama-PokeAppTests
//
//  Created by Eken Özlü on 3.11.2023.
//

import XCTest
@testable import Pazarama_PokeApp
final class Pazarama_PokeAppTests: XCTestCase {
    private var pokemonViewModel: PokemonViewModel!
    private var pokemonDetailViewModel: PokemonDetailViewModel!
    private var pokemonService: MockPokemonService!
    private var pokemonViewModelOutput: MockPokemonViewModelOutput!
    private var pokemonDetailViewModelOutput: MockPokemonDetailViewModelOutput!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //PokemonViewModel
        pokemonService = MockPokemonService()
        pokemonViewModel = PokemonViewModel(pokemonService: pokemonService)
        pokemonViewModelOutput = MockPokemonViewModelOutput()
        pokemonViewModel.output = pokemonViewModelOutput
        // PokemonDetailViewModel
        pokemonDetailViewModel = PokemonDetailViewModel(pokemonService: pokemonService)
        pokemonDetailViewModelOutput = MockPokemonDetailViewModelOutput()
        pokemonDetailViewModel.output = pokemonDetailViewModelOutput
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testGetPokemon_WhenAPISuccess_showsResult() throws {
        func testgetPokemon_WhenAPISuccess_showsResult() throws {
            let mockPokemonResult = PokemonResult(name: "ditto", url: "https://pokeapi.co/api/v2/pokemon-form/132", imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
            let mockPokemon = Pokemon(results: [mockPokemonResult])
            pokemonService.fetchPokemonMockResult = .success(mockPokemon)
            pokemonViewModel.fetchPokemon()
            XCTAssertEqual(pokemonViewModelOutput.pokemonDetail.count, 1)
        }
    }
    
    func testGetPokemonDetails_WhenAPISuccess_ShowResult() throws {
        let mockPokemonDetails = PokemonDetails(abilities: [
            Abilities(ability: PokemonNameUrlModel(name: "limber", url: "https://pokeapi.co/api/v2/ability/7/")),
            Abilities(ability: PokemonNameUrlModel(name: "imposter", url: "https://pokeapi.co/api/v2/ability/150/"))
        ], height: 3, id: 132, name: "ditto", species: PokemonNameUrlModel(name: "ditto", url: "https://pokeapi.co/api/v2/pokemon-species/132/"), sprites: Sprites(other: PokemonImage(officialArtwork: FrontDefaults(frontDefault: ""))), stats: [Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")),Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "attack", url: "https://pokeapi.co/api/v2/stat/2/")),Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "defense", url: "https://pokeapi.co/api/v2/stat/3/")),Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "special-attack", url: "https://pokeapi.co/api/v2/stat/4/")),Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "special-defense", url: "https://pokeapi.co/api/v2/stat/5/")),Stats(baseStat: 48, stat: PokemonNameUrlModel(name: "speed", url: "https://pokeapi.co/api/v2/stat/6/"))], types: [PokemonTypes(type: PokemonNameUrlModel(name: "normal", url: "https://pokeapi.co/api/v2/type/1/"))], weight: 40)
        pokemonService.fetchPokemonMockDetailsResult = .success(mockPokemonDetails)
        pokemonDetailViewModel.fetchPokemonDetail("ditto")
        XCTAssertEqual(pokemonDetailViewModelOutput.pokemonDetails.count, 1)
        XCTAssertEqual(pokemonDetailViewModelOutput.pokemonDetails[0].name, "ditto")
    }
    
    func testGetSpecies_WhenAPISuccess_ShowResult() throws {
        let mockFlavorText = "This is a sample flavor text."
        let mockLanguage = PokemonNameUrlModel(name: "en", url: "https://pokeapi.co/api/v2/language/9/")
        let mockSpecies = Species(flavorTextEntries: [FlavorTextEntries(flavorText: mockFlavorText, language: mockLanguage)])
        pokemonService.fetchPokemonSpeciesResult = .success(mockSpecies)
        pokemonDetailViewModel.fetchPokemonSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/132/")
        XCTAssertEqual(pokemonDetailViewModelOutput.pokemonSpecies.count, 1)
        XCTAssertEqual(pokemonDetailViewModelOutput.pokemonSpecies[0].flavorTextEntries.first?.flavorText, mockFlavorText)
    }
    
    
    class MockPokemonService: PokemonService {
        var fetchPokemonMockResult: Result<Pazarama_PokeApp.Pokemon, Pazarama_PokeApp.NetworkError>?
        var fetchPokemonMockDetailsResult: Result<Pazarama_PokeApp.PokemonDetails, Pazarama_PokeApp.NetworkError>?
        var fetchPokemonSpeciesResult: Result<Pazarama_PokeApp.Species, Pazarama_PokeApp.NetworkError>?
        func fetchPokemon(completion: @escaping (Result<Pazarama_PokeApp.Pokemon, Pazarama_PokeApp.NetworkError>) -> ()) {
            if let result = fetchPokemonMockResult {
                completion(result)
            }
        }
        func fetchPokemonDetail(name: String, completion: @escaping (Result<Pazarama_PokeApp.PokemonDetails, Pazarama_PokeApp.NetworkError>) -> ()) {
            if let result = fetchPokemonMockDetailsResult {
                completion(result)
            }
        }
        func fetchPokemonSpecies(url: String, completion: @escaping (Result<Pazarama_PokeApp.Species, Pazarama_PokeApp.NetworkError>) -> ()) {
            if let result = fetchPokemonSpeciesResult {
                completion(result)
            }
        }
    }
    class MockPokemonViewModelOutput: PokemonViewModelOutPut {
        var pokemonDetail: [(name: String, url: String, imageUrl: String?)] = []
        func getPokemon(_ pokemon: Pazarama_PokeApp.Pokemon) {
            if let name = pokemon.results.last?.name,
               let url = pokemon.results.last?.url,
               let imageUrl = pokemon.results.last?.imageUrl {
                pokemonDetail.append((name, url, imageUrl))
            }
        }
    }
    class MockPokemonDetailViewModelOutput: PokemonDetailViewModelOutPut {
        var pokemonDetails: [(abilities: [Abilities], height: Int, id: Int, name: String, species: PokemonNameUrlModel, sprites: Sprites, stats: [Stats], types: [PokemonTypes], weight: Int)] = []
        var pokemonSpecies: [(Species)] = []
        func getPokemonDetail(_ pokemon: Pazarama_PokeApp.PokemonDetails) {
            pokemonDetails.append((abilities: pokemon.abilities, height: pokemon.height, id: pokemon.id, name: pokemon.name, species: pokemon.species, sprites: pokemon.sprites, stats: pokemon.stats, types: pokemon.types, weight: pokemon.weight))
        }
        func getPokemonSpecies(_ flavorTextEntries: Pazarama_PokeApp.Species) {
            pokemonSpecies.append(flavorTextEntries)
        }
    }
}
