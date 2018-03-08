//
//  ViewController.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit
import GooglePlaces



class MainViewController: UIViewController {
    
    
        // TODO: Add a button to Main.storyboard to invoke onLaunchClicked.
        
    @IBAction func gfg(_ sender: Any) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        acController.autocompleteFilter?.type = .city
        present(acController, animated: true, completion: nil)
    }
    // Present the Autocomplete view controller when the button is pressed.
    
    }


   
