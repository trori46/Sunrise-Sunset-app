//
//  APIManager.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation



class APIManager {
    
    var day = Day()
    var lat: String!
    var long: String!
    
    init(lat: String, long: String, completion: @escaping (Day, String?) -> ()) {
        self.lat = lat
        self.long = long
        fetchRepo(completion: completion)
    }
    
    func fetchRepo(completion: @escaping (Day, String?) -> ()) {
        let request = "https://api.sunrise-sunset.org/json?lat=\(lat!)&lng=\(long!)&date=today"
        
        if let url = URL(string: request) {
            URLSession.shared.dataTask(with: url) {  (data, response, error) in
                if error == nil {
                    do {
                        self.day = try JSONDecoder().decode(Day.self, from: data!)
                        DispatchQueue.main.async {
                            completion(self.day, nil)
                        }
                    } catch {
                        print("Ërror JSON")
                    }
                }
                } .resume()
    }
    
    
}
}
