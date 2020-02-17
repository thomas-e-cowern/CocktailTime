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
    
    // Full Url when complete
    // URLString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
    // MARK: - Fetching data from API
    static func fetchCocktsilResults(with searchTerm: String, completion: @escaping ([Cocktail]?) -> Void) {
        // URL
        guard var url = baseUrl else {
            completion(nil)
            return
        }
        
        // Construct the url by appending path components
        url.appendPathComponent("api")
        url.appendPathComponent("json")
        url.appendPathComponent("v1")
        url.appendPathComponent("\(apiSecret)")
        url.appendPathComponent("search.php")
        
        // Break out the path components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the queries from the url example above
        let titleQueryItem = URLQueryItem(name: "s", value: searchTerm)

        // add queries to the query array
        components?.queryItems = [titleQueryItem]
        
        // Build the final url
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }
        
        print(finalUrl)
        
        // Building the request
        var request = URLRequest(url: finalUrl)
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

                completion(nil)
                return
            }
        }.resume()
    }

   var drinkList = [Cocktail]()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        CocktailTime.fetchDrinksJson { (result) in
//            switch result {
//            case .success(let drinks):
//
//                self.drinkList = drinks
//
//                print("drinkList: \(self.drinkList)")
//
//            case .failure(let error):
//                print("Failed to fetch JSON", error)
//            }
//        }
//    }
    
//    static func fetchDrinksJson (completion: @escaping (Result<[Cocktail], Error>) -> ()) {
//
//        // URLString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
//
//        let drink = "margarita"
//        var ingredients = [String]()
//
//        var urlComponents = URLComponents()
//
//        urlComponents.scheme = "https"
//        urlComponents.host = "www.thecocktaildb.com"
//        urlComponents.path = "/api/json/v1/1/search.php"
//        urlComponents.queryItems = [
//            URLQueryItem(name: "s", value: drink)
//        ]
//
//        guard let url = urlComponents.url else {
//            print("Error in the url guard let")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            // Check for errors
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            // Check for good data
//            guard let data = data else {
//                print("Error in data")
//                return
//            }
//
//            // If successful
//            do {
//                let cocktailService = try JSONDecoder().decode(CocktailService.self, from: data)
//                let drinks = cocktailService.cocktailResults
////                print("Drink: \(drinks)")
//                completion(.success(drinks))
//            } catch let jsonError {
//                completion(.failure(jsonError))
//            }
//
//        }.resume()
//    }
    }

