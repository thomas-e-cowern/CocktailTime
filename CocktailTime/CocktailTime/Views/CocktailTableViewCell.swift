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
    @IBOutlet weak var cocktailLabel: UILabel!
    
    // landing pad for data
    var cocktail: Cocktail? {
        didSet {
            print("landing pad")
            updateViews()
        }
    }
    
    // keeping view updated
    func updateViews() {
        // Showing the movie info
        print("cocktail in CocktailTableViewCell")
        guard let cocktail = cocktail else {
            print("Error in guard let for CocktailTableViewCell")
            return
        }
        print("Hit update views")
        
        // Fetching the movie poster
//        MovieController.getMoviePoster(movie) { (image) in
//            DispatchQueue.main.async {
//                self.moviePosterView.image = image
//            }
//        }
        
        // Updating the view:
        DispatchQueue.main.async {
            self.cocktailLabel.text = cocktail.name
//            self.movieRatingLabel.text = "Rating: \(movie.rating)"
//            self.movieTitleLabel.text = movie.title
//            self.movieSummaryLabel.text = movie.summary
        }
    }

}
