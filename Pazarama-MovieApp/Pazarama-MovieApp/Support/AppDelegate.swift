//
//  AppDelegate.swift
//  Pazarama-MovieApp
//
//  Created by Eken Özlü on 5.11.2023.
//

import UIKit
import Hero

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let movieService = APIManager()
        let viewModel = MainViewModel(movieService: movieService)
        let navCon = UINavigationController(rootViewController: MainVC(viewModel: viewModel))
        navCon.isHeroEnabled = true
        window?.rootViewController = navCon
        window?.makeKeyAndVisible()
        return true
    }

}

