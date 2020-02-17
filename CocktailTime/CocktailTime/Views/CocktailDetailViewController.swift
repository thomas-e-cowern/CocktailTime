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
    
    var cocktail: Cocktail? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Methods
    func updateViews() {
        if let cocktail = cocktail {
            self.title = "Your Chosen Cocktail"
            ciocktailNameLabel.text = cocktail.name
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
//            notesTextView.text = task.notes
        } else {
            self.title = "Else If"
        }
    }

}
