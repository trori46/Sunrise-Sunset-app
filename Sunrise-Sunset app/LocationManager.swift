//
//  LocationManager.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager:CLLocationManager!
    //var currentLocation = LocationManager.determineMyCurrentLocation()
    
    func determineMyCurrentLocation() -> CLLocationCoordinate2D {
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()

            
            locationManager.startUpdatingLocation()
            //       locationManager.startUpdatingHeading()
            
            
        }
        return locationManager.location!.coordinate
    }
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let userLocation:CLLocation = locations[0] as CLLocation
//  
//        manager.stopUpdatingLocation()
//        
//        print("user latitude = \(userLocation.coordinate.latitude)")
//        print("user longitude = \(userLocation.coordinate.longitude)")
//        //let locValue : CLLocationCoordinate2D = locationManager.location!.coordinate
//        //   region = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        
//    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            print("User allowed us to access location")
            
        }
        
    }

    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            completion(placemarks?.first?.location?.coordinate, error)
        }
    }
    
}
