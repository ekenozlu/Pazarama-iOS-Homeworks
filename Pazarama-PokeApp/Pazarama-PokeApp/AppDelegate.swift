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
        window?.rootViewController = MainVC()
        window?.makeKeyAndVisible()
        return true
    }

}

