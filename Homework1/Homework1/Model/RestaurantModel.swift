//
//  RestaurantModel.swift
//  Homework1
//
//  Created by Eken Özlü on 16.10.2023.
//

import Foundation

struct RestaurantModel {
    var restaurantName : String
    var restaurantImageName : String
    var restaurantType : String
    var restaurantRating : Double
    var restaurantRatingCount : Int
    
    init(restaurantName: String, restaurantImageName: String, restaurantType: String, restaurantRating: Double, restaurantRatingCount: Int) {
        self.restaurantName = restaurantName
        self.restaurantImageName = restaurantImageName
        self.restaurantType = restaurantType
        self.restaurantRating = restaurantRating
        self.restaurantRatingCount = restaurantRatingCount
    }
}

//TableView Static Data
let restaurantTV1 = RestaurantModel(restaurantName: "Pizza House", restaurantImageName: "restaurant:pizzahouse", restaurantType: "Bistro - Italian",
                                    restaurantRating: 4.3, restaurantRatingCount: 124)
let restaurantTV2 = RestaurantModel(restaurantName: "Health Inn", restaurantImageName: "restaurant:healthinn", restaurantType: "Restaurant - Vegan",
                                    restaurantRating: 4.1, restaurantRatingCount: 91)
let restaurantTV3 = RestaurantModel(restaurantName: "Kebapçı Emmi", restaurantImageName: "restaurant:kebabciemmi", restaurantType: "Restaurant - Turkish",
                                    restaurantRating: 4.9, restaurantRatingCount: 78)
let restaurantTV4 = RestaurantModel(restaurantName: "Fresh Roast", restaurantImageName: "restaurant:freshroast", restaurantType: "Cafe - Coffee",
                                    restaurantRating: 3.9, restaurantRatingCount: 85)
let restaurantTV5 = RestaurantModel(restaurantName: "Taco Del House", restaurantImageName: "restaurant:tacodelhouse", restaurantType: "Street - Mexican",
                                    restaurantRating: 4.2, restaurantRatingCount: 103)

let restaurantArrayForTV : [RestaurantModel] = [restaurantTV1,restaurantTV2,restaurantTV3,restaurantTV4,restaurantTV5]


//CollectionView Static Data
let restaurantCV1 = RestaurantModel(restaurantName: "Steak Burger", restaurantImageName: "restaurant:steakburger", restaurantType: "Bistro - Burgers",
                                    restaurantRating: 4.0, restaurantRatingCount: 67)
let restaurantCV2 = RestaurantModel(restaurantName: "Quick China", restaurantImageName: "restaurant:quickchina", restaurantType: "Restaurant - Eastern",
                                    restaurantRating: 4.5, restaurantRatingCount: 54)
let restaurantCV3 = RestaurantModel(restaurantName: "Happy Morning", restaurantImageName: "restaurant:happymorning", restaurantType: "Cafe - Breakfast",
                                    restaurantRating: 4.7, restaurantRatingCount: 71)
let restaurantCV4 = RestaurantModel(restaurantName: "Luingo's Spaghetti", restaurantImageName: "restaurant:luingospaghetti", restaurantType: "Bistro - Italian",
                                    restaurantRating: 3.4, restaurantRatingCount: 39)
let restaurantCV5 = RestaurantModel(restaurantName: "Bakes by Lili", restaurantImageName: "restaurant:bakesbylili", restaurantType: "Cafe - Breakfast",
                                  restaurantRating: 4.3, restaurantRatingCount: 97)

let restaurantArrayForCV : [RestaurantModel] = [restaurantCV1,restaurantCV2,restaurantCV3,restaurantCV4,restaurantCV5]



