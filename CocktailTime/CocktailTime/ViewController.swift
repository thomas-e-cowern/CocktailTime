//
//  ViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/16/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoursesJson { (result) in
            switch result {
            case .success(let courses):
                courses.forEach { (course) in
                    print(course.name)
                }
            case .failure(let error):
                print("Failed to fetch JSON", error)
            }
        }
    }
    
    fileprivate func fetchCoursesJson (completion: @escaping (Result<[Course], Error>) -> ()) {

        let URLString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string: URLString) else {
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
                let courses = try JSONDecoder().decode([Course].self, from: data)
                completion(.success(courses))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }


}

