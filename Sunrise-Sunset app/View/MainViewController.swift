
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
        acController.primaryTextColor = .darkGray
        acController.secondaryTextColor = .darkGray
        acController.navigationController?.navigationBar.barTintColor = .darkGray
        acController.tableCellBackgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "wall"))
        acController.tableCellSeparatorColor = .lightGray
        acController.tintColor = .lightGray
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.city
    }
    func setupMainView(place: GMSPlace?) {
        self.place = place
        locationLbl.text! = place?.name ?? "fsdfs"
        _ = APIManager(lat: (String(describing: place!.coordinate.latitude)), long: (String(describing: place!.coordinate.longitude))) { day, errorMessage in
            self.day = day
            self.sunriseLbl.text = self.convertUTCDateToLocalDate(dateToConvert: (day.results?.sunrise)!)
            self.sunsetLbl.text = self.convertUTCDateToLocalDate(dateToConvert: (day.results?.sunset)!)
        self.tableView.reloadData()
        }
    }
    func setupMainView(place: GMSPlace?, name: GMSAddressComponent) {
        self.place = place
        locationLbl.text! = name.name
        _ = APIManager(lat: (String(describing: place!.coordinate.latitude)), long: (String(describing: place!.coordinate.longitude))) { day, errorMessage in
            self.day = day
            self.sunriseLbl.text = self.convertUTCDateToLocalDate(dateToConvert: (day.results?.sunrise)!)
            self.sunsetLbl.text = self.convertUTCDateToLocalDate(dateToConvert: (day.results?.sunset)!)
            self.tableView.reloadData()
    }
    }

    func convertUTCDateToLocalDate(dateToConvert:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+00:00"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = dateFormatter.date(from: dateToConvert)// create   date from string
        
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: date!)

    }

}
