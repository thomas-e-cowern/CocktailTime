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
    let imageURL: String
    let numberOfLessons: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoursesJson ()
    }
    
    func fetchCoursesJson () {
        print("1,2,3")
    }


}

