//
//  SearchViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/18/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var searchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Methods
    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let text = searchTextField.text else { return }
        searchText = text
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchIdentifier" {
            let destinationVC = segue.destination as! TableViewController
            destinationVC.cocktailName = searchText
        }
    }
    

}
