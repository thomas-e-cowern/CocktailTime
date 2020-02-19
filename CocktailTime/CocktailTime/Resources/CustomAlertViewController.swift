//
//  CustomAlertViewController.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/19/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var alertTextField: UITextField!
    @IBOutlet weak var alertSearchButton: UIButton!
    
    // MARK: - Properties
    var delegate: CustomAlertViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    
    // MARK: - Methods
    func setupView() {
        alertView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView() {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        alertTextField.resignFirstResponder()
        delegate?.searchButtonTapped(alertTextFieldValue: alertTextField.text ?? "")
        self.dismiss(animated: true, completion: nil)
    }
}

protocol CustomAlertViewControllerDelegate : NSObjectProtocol {
    func searchButtonTapped(data: String)
}
