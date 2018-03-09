
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
    let acController = GMSAutocompleteViewController()
    var place: GMSPlace?
    var locManager = LocationManager()
    var dayManager: APIManager?
    var day: Day?
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBAction func searchBtn(_ sender: Any) {
        acController.delegate = self as GMSAutocompleteViewControllerDelegate
        setupSearchView()
        present(acController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "sunset.jpg"))
        self.tableView.backgroundView?.alpha = 0.7
        locManager.determineMyCurrentLocation()
        placesClient = GMSPlacesClient.shared()
        getCurrentPlaces()
    }
    
    @IBAction func currentLocationBtn(_ sender: Any) {
        getCurrentPlaces()
        }
    
    func setupSearchView() {
        acController.primaryTextColor = .white
        acController.secondaryTextColor = .white
        acController.navigationController?.navigationBar.barTintColor = .darkGray
        acController.tableCellBackgroundColor = .darkGray;
        acController.tableCellSeparatorColor = .lightGray;
        acController.tintColor = .lightGray;
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.city
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
   
