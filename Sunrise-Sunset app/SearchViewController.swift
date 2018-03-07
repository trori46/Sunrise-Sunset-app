//
//  SearchViewController.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

    import UIKit
    import GooglePlaces
    
    class SearchViewController: UIViewController, UISearchDisplayDelegate {
        
        var searchBar: UISearchBar?
        var tableDataSource: GMSAutocompleteTableDataSource?
        var searchDisplayController: UISearchDisplayController?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            searchBar = UISearchBar(CGRect(x: 0, y: 0, width: 250.0, height: 44.0))
            
            tableDataSource = GMSAutocompleteTableDataSource()
            tableDataSource?.delegate = self
            
            searchDisplayController = UISearchDisplayController(searchBar: searchBar!, contentsController: self)
            searchDisplayController?.searchResultsDataSource = tableDataSource
            searchDisplayController?.searchResultsDelegate = tableDataSource
            searchDisplayController?.delegate = self
            
            view.addSubview(searchBar!)
        }
        
        func didUpdateAutocompletePredictionsForTableDataSource(tableDataSource: GMSAutocompleteTableDataSource) {
            // Turn the network activity indicator off.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            // Reload table data.
            searchDisplayController?.searchResultsTableView.reloadData()
        }
        
        func didRequestAutocompletePredictionsForTableDataSource(tableDataSource: GMSAutocompleteTableDataSource) {
            // Turn the network activity indicator on.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            // Reload table data.
            searchDisplayController?.searchResultsTableView.reloadData()
        }
        
    }
    
    extension ViewController: GMSAutocompleteTableDataSourceDelegate {
        func tableDataSource(tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWithPlace place: GMSPlace) {
            searchDisplayController?.active = false
            // Do something with the selected place.
            print("Place name: \(place.name)")
            print("Place address: \(place.formattedAddress)")
            print("Place attributions: \(place.attributions)")
        }
        
        func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
            tableDataSource?.sourceTextHasChanged(searchString)
            return false
        }
        
        func tableDataSource(tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: NSError) {
            // TODO: Handle the error.
            print("Error: \(error.description)")
        }
        
        func tableDataSource(tableDataSource: GMSAutocompleteTableDataSource, didSelectPrediction prediction: GMSAutocompletePrediction) -> Bool {
            return true
        }
    }

}
