//
//  FruitModel.swift
//  FruitInfo
//
//  Created by Harsh Patel on 11/11/25.
//

import Foundation

struct FruitModel : Codable, Identifiable {
    var id : Int
    var name : String
    var family : String
    var order : String
    var genus : String
    var nutritions: Nutritions
}

struct Nutritions : Codable {
    var calories : Double
    var fat : Double
    var sugar : Double
    var carbohydrates : Double
    var protein : Double
}
