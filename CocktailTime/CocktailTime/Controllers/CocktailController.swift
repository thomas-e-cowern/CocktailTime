//
//  CocktailController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailTime: UIViewController {

   var drinkList = [Cocktail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CocktailTime.fetchDrinksJson { (result) in
            switch result {
            case .success(let drinks):

                self.drinkList = drinks
                
                print("drinkList: \(self.drinkList)")
                
            case .failure(let error):
                print("Failed to fetch JSON", error)
            }
        }
    }
    
    static func fetchDrinksJson (completion: @escaping (Result<[Cocktail], Error>) -> ()) {

        // URLString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        
        let drink = "margarita"
        var ingredients = [String]()
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "www.thecocktaildb.com"
        urlComponents.path = "/api/json/v1/1/search.php"
        urlComponents.queryItems = [
            URLQueryItem(name: "s", value: drink)
        ]

        guard let url = urlComponents.url else {
            print("Error in the url guard let")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Check for errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check for good data
            guard let data = data else {
                print("Error in data")
                return
            }
            
            // If successful
            do {
                let cocktailService = try JSONDecoder().decode(CocktailService.self, from: data)
                let drinks = cocktailService.cocktailResults
//                print("Drink: \(drinks)")
                completion(.success(drinks))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
}
