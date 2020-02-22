//
//  Helper.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/18/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static func createIngredientList (recipe: Recipe) -> [String] {
        
        // Variables
        var finalIngredientArray = [String]()
        var finalMeasureArray = [String]()
        var finalCombinedArray = [[String]]()
        
        // Combine ingredients into array
        let ingredientsArray = [recipe.ingredient1, recipe.ingredient2, recipe.ingredient3, recipe.ingredient4, recipe.ingredient5, recipe.ingredient7, recipe.ingredient8, recipe.ingredient9, recipe.ingredient10, recipe.ingredient11, recipe.ingredient12, recipe.ingredient13, recipe.ingredient14, recipe.ingredient15]
        
        // Combine measures into array
        let measureArray = [recipe.measure1, recipe.measure2, recipe.measure3, recipe.measure4, recipe.measure5, recipe.measure6, recipe.measure7,recipe.measure8, recipe.measure9, recipe.measure10, recipe.measure11, recipe.measure12, recipe.measure13, recipe.measure14, recipe.measure15]
        
        // remove nil values from ingredient array
        for ingredient in ingredientsArray {
            if ingredient == nil {
                // Do nothing
            } else {
                finalIngredientArray.append(ingredient ?? "")
            }
        }
        
        // remove nil values from measures array
        for measure in measureArray {
            if measure == nil {
                // Do nothing
            } else {
                finalMeasureArray.append(measure ?? "")
            }
        }
        // Combine the arrays
        func combineArrays (ingredients: [String], measures: [String]) -> [String] {
            var combinedArray = [String]()
            let ingCount = ingredients.count
            let meaCount = measures.count
            let diff = ingCount - meaCount

            if diff == 0 {
                for i in 0..<ingredients.count {
                    combinedArray.append("\(measures[i]) \(ingredients[i])")
                }
            } else if diff > 0 {
                for i in 0..<meaCount {
                    combinedArray.append("\(measures[i]) \(ingredients[i])")
                }
                for i in meaCount..<ingCount {
                    combinedArray.append("\(ingredients[i])")
                }
            }
            return combinedArray 
        }
        
        let combinedArrays = combineArrays(ingredients: finalIngredientArray, measures: finalMeasureArray)
        
        if combinedArrays == [] {
            return ["No Ingredients Listed"]
        }
        return combinedArrays
    }
    
    static func buildSearchUrl (searchFor: String, searchTerm: String) -> String {

        var baseUrlString = ""
        let apiSecret = "1"
           
        // Full Url when complete for name
        // URLString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
           
        // Full Url when complete for alcohol
        // URLString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Jack Daniels"

        
        if searchFor == "cocktail" {
            baseUrlString = "https://www.thecocktaildb.com/api/json/v1/\(apiSecret)/search.php?s=\(searchTerm)"
        } else {
            baseUrlString = "https://www.thecocktaildb.com/api/json/v1/\(apiSecret)/filter.php?i=\(searchTerm)"
        }
        
        return baseUrlString
    }
    
    static func buildIdUrl (id: String) -> String {

        var baseUrlString = ""
        let apiSecret = "1"
           
        // Full Url when complete for name
        // URLString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=11007"
                
        baseUrlString = "https://www.thecocktaildb.com/api/json/v1/\(apiSecret)/lookup.php?i=\(id)"
        
        return baseUrlString
    }
}
