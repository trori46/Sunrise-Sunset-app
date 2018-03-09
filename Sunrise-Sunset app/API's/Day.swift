//
//  Structure.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation

struct Day: Decodable {
    var results: Results?
}

struct Results: Decodable {
    var sunrise: String?
    var sunset: String?
}
