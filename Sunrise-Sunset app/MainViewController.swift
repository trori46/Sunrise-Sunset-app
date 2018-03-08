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
    var place: GMSPlace?
    var locManager: LocationManager?
    var dayManager: APIManager?
    var day: Day?
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBAction func searchBtn(_ sender: Any) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self as GMSAutocompleteViewControllerDelegate
        acController.autocompleteFilter?.type = .city
        present(acController, animated: true, completion: nil)
    }
    @IBAction func currentLocationBtn(_ sender: Any) {
        
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
    }


   
