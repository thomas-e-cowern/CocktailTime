//
//  Cocktail.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/16/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

struct CocktailService: Codable {
    
    let cocktailResults: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktailResults = "drinks"
    }
    
}

struct Cocktail : Codable {
    var id: String
    var name: String
    var glass: String
    var thumbnail: String
    var instructions: String
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case glass = "strGlass"
        case thumbnail = "strDrinkThumb"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
    }
}

struct IngredientService: Codable {
    
    let ingredientResults: [Ingredients]
    
    enum CodingKeys: String, CodingKey {
        case ingredientResults = "drinks"
    }
    
}

struct Ingredients : Codable {
    var id: String
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
    }
}
