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
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
    }
}
