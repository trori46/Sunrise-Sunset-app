//
//  GooglePlacesAPI.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/8/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation
import GooglePlaces

extension MainViewController: GMSAutocompleteViewControllerDelegate {
   
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place.coordinate)
        setupMainView(place: place)
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
}
