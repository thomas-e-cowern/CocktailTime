//
//  TableViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var searchTerm: String?
    var searchName: String?
    
    var cocktailList = [Cocktail]()
    var alcoholList = [Alcohol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let searchTerm = searchTerm, let searchName = searchName else {
            return
        }
        
        fetchCocktails(searchTerm: searchTerm, searchName: searchName)
    }
    
    func fetchCocktails(searchTerm: String, searchName: String) {
        print("Search Term: \(searchTerm) SearchName; \(searchName)")

        if searchName == "cocktail" {
            CocktailController.fetchCocktsilResults(with: searchTerm, searchFor: searchName) { (cocktails) in
                guard let fetchedCocktails = cocktails else { return }
                self.cocktailList = fetchedCocktails
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } else {
            CocktailController.fetchAlcoholResults(with: searchTerm, searchFor: searchName) { (cocktails) in
                guard let fetchedCocktails = cocktails else { return }
                self.alcoholList = fetchedCocktails
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchName == "cocktail" {
            return cocktailList.count
        } else {
            return alcoholList.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchName == "cocktail" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as!
                CocktailTableViewCell
            let cocktail = cocktailList[indexPath.row]
            cell.cocktail = cocktail
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as!
                CocktailTableViewCell
            let cocktail = alcoholList[indexPath.row]
            cell.alcohol = cocktail
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toCocktailDetail" {
            if cocktailList[0].name == "We can't find that cocktail!  Hit the back button and try again"  {
                return false
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCocktailDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as! CocktailDetailViewController
            let cocktial = cocktailList[indexPath.row]
            destinationVC.cocktail = cocktial
        }
    }
}
