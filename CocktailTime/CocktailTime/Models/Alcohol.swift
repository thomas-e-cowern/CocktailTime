//
//  Alcohol.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/21/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

struct AlcoholService: Codable {
    
    let alcoholResults: [Alcohol]
    
    enum CodingKeys: String, CodingKey {
        case alcoholResults = "drinks"
    }
    
}

struct Alcohol : Codable {
    var name: String
    var image: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case image = "strDrinkThumb"
        case id = "idDrink"
        
    }
}
