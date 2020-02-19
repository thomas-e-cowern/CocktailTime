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
    @IBOutlet weak var nameSearchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var alcoholSearchButton: UIButton!
    @IBOutlet weak var nameSearchStackview: UIStackView!
    @IBOutlet weak var alcoholSearchStackview: UIStackView!
    
    var searchText = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Methods
    func showCustomAlert(title: String) {
        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertID") as! CustomAlertViewController
               customAlert.providesPresentationContextTransitionStyle = true
               customAlert.definesPresentationContext = true
               customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
               customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
               customAlert.delegate = self
               self.present(customAlert, animated: true, completion: nil)
               customAlert.alertLabel.text = title
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        // Starts the whole show....
    }
    
    @IBAction func nameSearchButtonPressed(_ sender: Any) {
       showCustomAlert(title: "Enter a cocktail name")
    }
    
    @IBAction func alcoholSearchButtonPressed(_ sender: Any) {
//        alcoholSearchStackview.isHidden = false
        showCustomAlert(title: "Enter a liquor")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchIdentifier" {
            guard let searchText = searchTextField.text else { return }
            let destinationVC = segue.destination as! TableViewController
            print("SC in SVC: \(searchText)")
            destinationVC.cocktailName = searchText
        }
    }
}

extension SearchViewController: CustomAlertViewDelegate {
    func searchButtonTapped(alertTextFieldValue: String) {
        print("TextField has value: \(alertTextFieldValue)")
//        searchText = alertTextFieldValue
    }
    
    func cancelButtonTapped() {
        print("cancelButtonTapped")
    }
}
