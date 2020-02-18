//
//  TableViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/17/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var cocktailName: String?
    
    var cocktailList = [Cocktail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktails()
        
    }
    
    func fetchCocktails() {
        guard let cocktailName = cocktailName else {
            print("Error in fetch cocktails")
            return
        }
        CocktailController.fetchCocktsilResults(with: cocktailName) { (cocktails) in
            guard let fetchedCocktails = cocktails else { return }
            self.cocktailList = fetchedCocktails
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as!
            CocktailTableViewCell
//        print(cocktailList)
        let cocktail = cocktailList[indexPath.row]
//        print(cocktail)
        cell.cocktail = cocktail
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCocktailDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as! CocktailDetailViewController
            let cocktial = cocktailList[indexPath.row]
//            print("cocktail from table view controller navigation: \(cocktial)")
            destinationVC.cocktail = cocktial
        }
    }
}
