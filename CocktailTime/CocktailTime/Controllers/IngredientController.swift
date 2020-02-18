//
//  IngredientController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class IngredientController: UIViewController {
    
    // MARK: - Properties
       static let baseUrl = URL(string: "https://www.thecocktaildb.com")
       private static let apiSecret = "1"
    
    // Get ingredients for cocktail
    static func getCocktailIngredients (id: String) -> [String] {
        print("id from GCI: \(id)")
        
        guard var url = baseUrl else {
            return ["Error in URL"]
        }
        
        // Construct the url by appending path components
        url.appendPathComponent("api")
        url.appendPathComponent("json")
        url.appendPathComponent("v1")
        url.appendPathComponent("\(apiSecret)")
        url.appendPathComponent("lookup.php")
        
        // Break out the path components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the queries from the url example above
        let ingredients = URLQueryItem(name: "i", value: id)
        
        // add queries to the query array
        components?.queryItems = [ingredients]
        
        // Build the final url
        guard let finalUrl = components?.url else {
            return ["Error in final URL"]
        }
        
        print("finalUrl: \(finalUrl)")
        
        // Building the request
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Making the fetch call to the API
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // if the call fails immediately
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
//                completion(nil)
                return
            }
            
            // Checking to see if data is there
            guard let data = data else {
//                completion(nil)
                return
            }
            
            // Parsing the data into something usefull
            let jsonDecoder = JSONDecoder()
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("json: \(json)")
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
        return ["Ingreient 1", "Ingreient 2", "Ingreient 3", "Ingreient 4"]
    }
}
