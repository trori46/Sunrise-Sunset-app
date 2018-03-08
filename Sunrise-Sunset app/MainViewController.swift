
//
//  ViewController.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation


class MainViewController: UITableViewController {
    var placesClient: GMSPlacesClient?
    
    var place: GMSPlace?
    var locManager = LocationManager()
    var dayManager: APIManager?
    var day: Day?
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBAction func searchBtn(_ sender: Any) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self as GMSAutocompleteViewControllerDelegate
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.city
        present(acController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.determineMyCurrentLocation()
        placesClient = GMSPlacesClient.shared()
        getCurrentPlaces()
    }
    
    @IBAction func currentLocationBtn(_ sender: Any) {
        getCurrentPlaces()
        }
    
    func setupMainView(place: GMSPlace?) {
        self.place = place
        locationLbl.text! = place?.name ?? "fsdfs"
        _ = APIManager(lat: (String(describing: place!.coordinate.latitude)), long: (String(describing: place!.coordinate.longitude))) { day, errorMessage in
            self.day = day
            self.sunriseLbl.text = day.results?.sunrise
            self.sunsetLbl.text = day.results?.sunset
        self.tableView.reloadData()
        }
    }
    func setupMainView(place: GMSPlace?, name: GMSAddressComponent) {
        self.place = place
        locationLbl.text! = name.name
        _ = APIManager(lat: (String(describing: place!.coordinate.latitude)), long: (String(describing: place!.coordinate.longitude))) { day, errorMessage in
            self.day = day
            self.sunriseLbl.text = day.results?.sunrise
            self.sunsetLbl.text = day.results?.sunset
            self.tableView.reloadData()
    }
    }

}
   
