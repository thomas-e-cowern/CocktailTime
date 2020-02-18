//
//  Helper.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/18/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

class Helper {
    
    
    static func createIngredientList (cocktail: Cocktail) -> [[String]] {
        
        //
        var finalIngredientArray = [String]()
        var finalMeasureArray = [String]()
        var finalCombinedArray = [[String]]()
        
        // Combine ingredients into array
        let ingredientsArray = [cocktail.ingredient1, cocktail.ingredient2, cocktail.ingredient3, cocktail.ingredient4, cocktail.ingredient5, cocktail.ingredient7, cocktail.ingredient8, cocktail.ingredient9, cocktail.ingredient10, cocktail.ingredient11, cocktail.ingredient12, cocktail.ingredient13, cocktail.ingredient14, cocktail.ingredient15]
        
        // Combine measures into array
        let measureArray = [cocktail.measure1, cocktail.measure2, cocktail.measure3, cocktail.measure4, cocktail.measure5, cocktail.measure6, cocktail.measure7, cocktail.measure8, cocktail.measure9, cocktail.measure10, cocktail.measure11, cocktail.measure12, cocktail.measure13, cocktail.measure14, cocktail.measure15]
        
        let combinedArray = [[cocktail.ingredient1, cocktail.measure1], [cocktail.ingredient2, cocktail.measure2], [cocktail.ingredient3, cocktail.measure3], [cocktail.ingredient4, cocktail.measure4], [cocktail.ingredient5, cocktail.measure5], [cocktail.ingredient6, cocktail.measure6], [cocktail.ingredient7, cocktail.measure7], [cocktail.ingredient8, cocktail.measure8], [cocktail.ingredient9, cocktail.measure9], [cocktail.ingredient10, cocktail.measure10], [cocktail.ingredient11, cocktail.measure11], [cocktail.ingredient12, cocktail.measure12], [cocktail.ingredient13, cocktail.measure13], [cocktail.ingredient14, cocktail.measure14], [cocktail.ingredient15, cocktail.measure15]]
        
//        print(combinedArray)

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
        
        func combineArrays (ingredients: [String], measures: [String]) -> [[String]] {
            
            var combinedArray = [[String]]()
            let ingCount = ingredients.count
            let meaCount = measures.count
            let diff = ingCount - meaCount
            print("DIff: \(diff)")
            if diff == 0 {
                for i in 0..<ingredients.count {
                    combinedArray.append([ingredients[i], measures[i]])
                }
            } else if diff > 0 {
                for i in 0..<meaCount {
                    combinedArray.append([ingredients[i], measures[i]])
                }
                for i in meaCount..<ingCount {
                    combinedArray.append([ingredients[i]])
                }
                
            }

            return combinedArray 
        }
        
        let combinedArrays = combineArrays(ingredients: finalIngredientArray, measures: finalMeasureArray)
        
        return combinedArrays
    }
}
