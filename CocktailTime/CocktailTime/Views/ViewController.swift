//
//  ViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/16/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var drinkList = [Cocktail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDrinksJson { (result) in
            switch result {
            case .success(let drinks):

                self.drinkList = drinks
                
            case .failure(let error):
                print("Failed to fetch JSON", error)
            }
        }
    }
    
    fileprivate func fetchDrinksJson (completion: @escaping (Result<[Cocktail], Error>) -> ()) {

        // URLString should be "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        
        let drink = "scotch"
        
        // Put together the url
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
        
        print("URL: \(url)")
        
        // Make the call to the API
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
            
            // If successful, return the drinks
            do {
                let cocktailService = try JSONDecoder().decode(CocktailService.self, from: data)
                let drinks = cocktailService.cocktailResults
                completion(.success(drinks))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
}
