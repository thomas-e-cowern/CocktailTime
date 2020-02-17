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
    @IBOutlet weak var cocktailImage: UIImageView!
    
    // landing pad for data
    var cocktail: Cocktail? {
        didSet {
            updateViews()
        }
    }
    
    // keeping view updated
    func updateViews() {
        guard let cocktail = cocktail else {
            print("Error in guard let for CocktailTableViewCell")
            return
        }
//        print("Hit update views")
        
        // Fetching the cocktail thumbnail
        CocktailController.getCocktailThumbnail(cocktail) { (image) in
            guard let image = image else {
                print("error getting image in cocktailTableViewCell")
                return
            }
            DispatchQueue.main.async {
                self.cocktailImage.image = image
            }
        }
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
