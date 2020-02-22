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
    @IBOutlet weak var copyIngredientsButton: UIButton!
    
    // Properties
    var ingredientsAndMeasures = [String]()

    var fetchedRecipe : Recipe?
    
    var cocktail: Cocktail? {
        didSet {
            loadViewIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        
        guard let cocktail = cocktail else {
            print("Cocktail is bad")
            return
        }

        fetchRecipe(cocktail)
        
        // Center instructions and ingredients
        cocktailInstructionsText.center.x = self.view.center.x
        ingredientsTableView.center.x = self.view.center.x
    }

    // MARK: - Methods
    
    func fetchRecipe(_ cocktail: Cocktail) {
        
        CocktailController.fetchRecipeResults(with: cocktail.id) { (recipe) in
            guard let fetchedRecipe = recipe else {
                print("bad recipe")
                return
            }
            self.fetchedRecipe = fetchedRecipe
            self.ingredientsAndMeasures = Helper.createIngredientList(recipe: fetchedRecipe)
            print("IG: \(self.ingredientsAndMeasures)")
                DispatchQueue.main.async {
                    self.ingredientsTableView.reloadData()
                    self.updateViews()
                }
            
            CocktailController.getImage(fetchedRecipe.thumbnail) { (image) in
            guard let image = image else {
                print("error getting image in cocktailTableViewCell")
                return
            }
                DispatchQueue.main.async {
                    self.cocktailImage.image = image
                    self.updateViews()
                }
            }
        }
    }
    
    func updateViews() {

        // Center instructions and ingredients
        cocktailInstructionsText.center.x = self.view.center.x
        ingredientsTableView.center.x = self.view.center.x
        
        self.title = "Your Chosen Cocktail"
        ciocktailNameLabel.text = fetchedRecipe?.name

        cocktailInstructionsText.text = fetchedRecipe?.instructions
        cocktailInstructionsText.translatesAutoresizingMaskIntoConstraints = true
        cocktailInstructionsText.sizeToFit()
        cocktailInstructionsText.isScrollEnabled = false
    }

    @IBAction func copyIngredientsPressed(_ sender: Any) {
        print("Copy ingredients pressed")
        var copyIngredientsList = ""
        for i in 0..<ingredientsAndMeasures.count {
            copyIngredientsList += " \(ingredientsAndMeasures[i])\n"
        }
        print(copyIngredientsList)
        let pasteboard = UIPasteboard.general
        pasteboard.string = copyIngredientsList
    }
    
    
    // MARK - Table view methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsAndMeasures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        let text = "\(ingredientsAndMeasures[indexPath.row])"
        cell.textLabel?.text = text
        return cell
    }
}
