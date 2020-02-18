//
//  CocktailDetailViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    @IBOutlet weak var ciocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailInstructionsText: UITextView!
    
    var ingredientsArray = [String?]()
    var finalIngredientArray = [String]()
    
    var cocktail: Cocktail? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientsArray = [cocktail?.ingredient1, cocktail?.ingredient2, cocktail?.ingredient3, cocktail?.ingredient4, cocktail?.ingredient5, cocktail?.ingredient7, cocktail?.ingredient8, cocktail?.ingredient9, cocktail?.ingredient10, cocktail?.ingredient11, cocktail?.ingredient12, cocktail?.ingredient13, cocktail?.ingredient14, cocktail?.ingredient15]
        print(ingredientsArray)
        for ingredient in ingredientsArray {
            if ingredient == nil {
                // Do nothing
            } else {
                finalIngredientArray.append(ingredient ?? "")
            }
        }
        print(finalIngredientArray)
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
            
            //Getting the ingredients
//            let id = cocktail.id
//            let response = IngredientController.getCocktailIngredients(id: id)
//            print("Response: \(response)")
            
            cocktailInstructionsText.text = cocktail.instructions
            print(cocktail)
        } else {
            self.title = "Else If"
        }
    }

}
