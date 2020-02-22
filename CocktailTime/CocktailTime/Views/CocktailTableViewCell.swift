//
//  CocktailTableViewCell.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailLabel: UILabel!
    
    // landing pad for data
    var cocktail: Cocktail? {
        didSet {
            updateViews(type: "cocktail")
        }
    }
    
    var alcohol: Alcohol? {
        didSet {
            updateViews(type: "alcohol")
        }
    }
    
    var type = ""
    
    // keeping view updated
    func updateViews(type: String) {
        if type == "cocktail" {
            print("cocktail")
            guard let cocktail = cocktail else {
                print("Error in guard let for CocktailTableViewCell")
                return
            }
        } else {
            print("Alcohol")
            guard let alcohol = alcohol else {
                print("Error in guard let for alcoholTableViewCell")
                return
            }
        }
        
        if cocktail?.name == "We can't find that cocktail!  Hit the back button and try again" {
            cocktailImage.image = UIImage(named: "noC")
        } else {
            // Fetching the cocktail thumbnail
            guard let cocktail = cocktail else { return }
            CocktailController.getCocktailThumbnail(cocktail) { (image) in
                guard let image = image else {
                    print("error getting image in cocktailTableViewCell")
                    return
                }
                DispatchQueue.main.async {
                    self.cocktailImage.image = image
                }
            }
        }
        
        // Updating the view:
        DispatchQueue.main.async {
            self.cocktailLabel.text = self.cocktail?.name
        }
    }

}
