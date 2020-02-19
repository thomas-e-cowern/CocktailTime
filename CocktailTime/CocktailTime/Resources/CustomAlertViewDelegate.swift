//
//  CustomAlertViewDelegate.swift
//  CocktailTime
//
//  Created by Thomas Cowern New on 2/19/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

protocol CustomAlertViewDelegate: class {
    func searchButtonTapped(alertTextFieldValue: String)
    func cancelButtonTapped()
}
