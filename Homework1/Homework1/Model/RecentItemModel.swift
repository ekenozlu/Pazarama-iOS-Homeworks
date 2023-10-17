//
//  RecentItemModel.swift
//  Homework1
//
//  Created by Eken Özlü on 16.10.2023.
//

import Foundation

struct RecentItemModel {
    var itemName : String
    var itemRestaurant : String
    var itemImageName : String
    var itemRestaurantRating : Double
    var ratingCount : Int
    
    init(itemName: String, itemRestaurant: String, itemImageName: String, itemRestaurantRating: Double, ratingCount: Int) {
        self.itemName = itemName
        self.itemRestaurant = itemRestaurant
        self.itemImageName = itemImageName
        self.itemRestaurantRating = itemRestaurantRating
        self.ratingCount = ratingCount
    }
}

let item1 = RecentItemModel(itemName: "Croissant Menu", itemRestaurant: "Uptown Bakery", itemImageName: "item:croissantmenu",
                            itemRestaurantRating: 4.5, ratingCount: 94)
let item2 = RecentItemModel(itemName: "Margherita Pizza", itemRestaurant: "New York Pizzeria", itemImageName: "item:margherita",
                            itemRestaurantRating: 4.1, ratingCount: 78)
let item3 = RecentItemModel(itemName: "Double Spicy Taco", itemRestaurant: "Theo Taco", itemImageName: "item:doublespicytaco",
                            itemRestaurantRating: 4.5, ratingCount: 94)
let item4 = RecentItemModel(itemName: "Dürüm with Ayran", itemRestaurant: "Merkez Döner", itemImageName: "item:durumwithayran",
                            itemRestaurantRating: 4.5, ratingCount: 94)
let item5 = RecentItemModel(itemName: "Falafel Bowl", itemRestaurant: "Vegan World", itemImageName: "item:falafelbowl",
                            itemRestaurantRating: 4.5, ratingCount: 94)

let recentItemsArray : [RecentItemModel] = [item1,item2,item3,item4,item5]
