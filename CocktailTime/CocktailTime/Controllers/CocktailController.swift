//
//  CocktailController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailController: UIViewController {
    
    // MARK: - Properties
    static let baseUrl = URL(string: "https://www.thecocktaildb.com")
    private static let apiSecret = "1"
    
    // Full Url when complete for name
    // URLString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
    // Full Url when complete for alcohol
    // URLString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Jack Daniels"
    
    // MARK: - Fetching data from API
    static func fetchCocktsilResults(with searchTerm: String, searchFor: String, completion: @escaping ([Cocktail]?) -> Void) {
        
        let finalUrl = URL(string: Helper.buildSearchUrl(searchFor: searchFor, searchTerm: searchTerm))
        
        guard let url = finalUrl else {
                completion(nil)
                return
        }
        
        // Building the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Making the fetch call to the API
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // if the call fails immediately
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Checking to see if data is there
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Parsing the data into something usefull
            let jsonDecoder = JSONDecoder()
            
            do {
                let cocktailService = try jsonDecoder.decode(CocktailService.self, from: data)
                let cocktails = cocktailService.cocktailResults
                
                completion(cocktails)
            } catch {
                print("😡 👎 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                let cocktailError = Cocktail(name: "We can't find that cocktail!  Hit the back button and try again", image: "None", id: "")
                completion([cocktailError])
                return
            }
        }.resume()
    }
    
    static func fetchRecipeResults(with id: String, completion: @escaping (Recipe?) -> Void) {
        
        let finalUrl = URL(string: Helper.buildIdUrl(id: id))
        
        guard let url = finalUrl else {
                completion(nil)
                return
        }
        
        // Building the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Making the fetch call to the API
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // if the call fails immediately
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Checking to see if data is there
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Parsing the data into something usefull
            let jsonDecoder = JSONDecoder()
            
            do {
                let recipeService = try jsonDecoder.decode(RecipeService.self, from: data)
                let recipe = recipeService.recipeResults[0]
                
                completion(recipe)
            } catch {
                print("😡 👎 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                return
            }
        }.resume()
    }
    
    // MARK: - Fetching image from the web
    static func getImage(_ url: String, completion: @escaping ((UIImage?)) -> Void) {
        
        //Setting up the url to get the poster
        guard let ingredientlUrl = URL(string: url) else {
            print("error in thumbnailUrl")
            return
        }
        
        //Start the data taks to fetch the cocktail image
        URLSession.shared.dataTask(with: ingredientlUrl) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            // check to see the data is good
            guard let thumbnailData = data else {
                print("Data is no good")
                completion(nil)
                return
            }
            
            // change the data into a UIImage to be displayed
            let image = UIImage(data: thumbnailData)
            completion(image)
        }.resume()
    }
}

