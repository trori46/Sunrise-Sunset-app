//
//  GooglePlacesManager.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

// json nearby request example: https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=37.7858956,-122.4067728&radius=50&key=AIzaSyDLxIv8iHmwytbkXR5Gs2U9rqoLixhXIXM

import Foundation
import UIKit
import CoreLocation

class GooglePlacesManager{
    // places storage
    var foundedPlaces = [Place]()
    
    // * * *
    var apiKey: String = "none"
    var currentLocation =

    // MARK: - Init
    /// Initialization of nearby/byName search
    init(apiKey: String, currentLocation: CLLocationCoordinate2D, placeName: String? = nil, completion: @escaping ([Place]?, String?) -> ()) {
        self.apiKey = apiKey
        self.currentLocation = currentLocation
        
        if let name = placeName{
            getBasicData(byName: name, completion: completion)
        } else{
            fetchPlaces(completion: completion)
        }
    }
}
