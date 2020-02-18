//
//  CocktailDetailViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlets
    @IBOutlet weak var ciocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailInstructionsText: UITextView!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    // Properties
    var ingredientsAndMeasures = [[String]]()
    
    var cocktail: Cocktail? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self

        guard let cocktail = cocktail else { return }
        
        ingredientsAndMeasures = Helper.createIngredientList(cocktail: cocktail)
        print("IAM: \(ingredientsAndMeasures)")
        
    }
    

    // MARK: - Methods
    func updateViews() {
        if let cocktail = cocktail {
            self.title = "Your Chosen Cocktail"
            ciocktailNameLabel.text = cocktail.name
            
            // Getting the thumbnail
            CocktailController.getCocktailThumbnail(cocktail) { (image) in
                guard let image = image else {
                    print("error getting image in cocktailTableViewCell")
                    return
                }
                DispatchQueue.main.async {
                    self.cocktailImage.image = image
                }
            }
            
            cocktailInstructionsText.text = cocktail.instructions
//            print(cocktail)
        } else {
            self.title = "Else If"
        }
    }

    // MARK - Table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsAndMeasures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        print("IP: \(ingredientsAndMeasures[indexPath.row][0])")
        let text = "\(ingredientsAndMeasures[indexPath.row][0]) \()"
        cell.textLabel?.text = text
        return cell
    }
}
