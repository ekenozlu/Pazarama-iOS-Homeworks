//
//  KitchensModel.swift
//  Homework1
//
//  Created by Eken Özlü on 16.10.2023.
//

import Foundation

struct KitchenModel {
    var kitchenName : String
    var kitchenImageName : String
    
    init(kitchenName: String, kitchenImageName: String) {
        self.kitchenName = kitchenName
        self.kitchenImageName = kitchenImageName
    }
    
}

let kitchen1  = KitchenModel(kitchenName: "Offers", kitchenImageName: "kitchen:offers")
let kitchen2  = KitchenModel(kitchenName: "Italian", kitchenImageName: "kitchen:italian")
let kitchen3  = KitchenModel(kitchenName: "Turkish", kitchenImageName: "kitchen:turkish")
let kitchen4  = KitchenModel(kitchenName: "Mexican", kitchenImageName: "kitchen:mexican")
let kitchen5  = KitchenModel(kitchenName: "Burgers", kitchenImageName: "kitchen:burgers")
let kitchen6  = KitchenModel(kitchenName: "Street Food", kitchenImageName: "kitchen:street")
let kitchen7  = KitchenModel(kitchenName: "Eastern", kitchenImageName: "kitchen:eastern")
let kitchen8  = KitchenModel(kitchenName: "Coffee", kitchenImageName: "kitchen:coffee")
let kitchen9  = KitchenModel(kitchenName: "Breakfast", kitchenImageName: "kitchen:breakfast")
let kitchen10 = KitchenModel(kitchenName: "Vegan", kitchenImageName: "kitchen:vegan")

let kitchenArray : [KitchenModel] = [kitchen1,kitchen2,kitchen3,kitchen4,kitchen5,
                                     kitchen6,kitchen7,kitchen8,kitchen9,kitchen10]


