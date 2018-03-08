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
    var locationManager: CLLocationManager!
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            if CLLocationManager.authorizationStatus() == .notDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.startUpdatingLocation()
        
            
            
        }
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // locationManager.requestLocation()
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        //     let locValue : CLLocationCoordinate2D = locationManager.location!.coordinate
        //   region = MKCoordinateRegion(center: locValue, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            print("User allowed us to access location")
            
        }
        
    }
   
    
}
