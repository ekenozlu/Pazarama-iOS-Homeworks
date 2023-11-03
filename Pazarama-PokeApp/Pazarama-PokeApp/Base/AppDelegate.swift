//
//  AppDelegate.swift
//  Pazarama-PokeApp
//
//  Created by Eken Özlü on 3.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let pokemonService: PokemonService = APIManager()
        let viewModel = PokemonViewModel(pokemonService: pokemonService)
        let detailViewModel = PokemonDetailViewModel(pokemonService: pokemonService)
        window?.rootViewController = MainVC(viewModel: viewModel, detailViewModel: detailViewModel)
        window?.makeKeyAndVisible()
        return true
    }

}

