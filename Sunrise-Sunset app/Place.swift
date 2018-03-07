//
//  Place.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//
import Foundation
import Alamofire

enum PlaceType {
    case All
    case Geocode
    case Address
    case Establishment
    case Regions
    case Cities
    
    var description : String {
        switch self {
        case .All: return ""
        case .Geocode: return "geocode"
        case .Address: return "address"
        case .Establishment: return "establishment"
        case .Regions: return "regions"
        case .Cities: return "cities"
        }
    }
}

struct Place {
    let id: String
    let description: String
}

protocol GooglePlacesAutocompleteDelegate {
    func placeSelected(place: Place)
    func placeViewClosed()
}
