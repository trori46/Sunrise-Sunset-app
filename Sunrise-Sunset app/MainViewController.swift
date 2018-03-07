//
//  ViewController.swift
//  Sunrise-Sunset app
//
//  Created by Viktoriia Rohozhyna on 3/7/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gpaViewController = GooglePlacesAutocomplete(
            apiKey: "YOUR API KEY",
            placeType: .Cities
        )
        gpaViewController.placeDelegate = self
        
        presentViewController(gpaViewController, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MainViewController: GooglePlacesAutocompleteDelegate {
    func placeSelected(place: Place) {
        println(place.description)
    }
    
    func placeViewClosed() {
        dismissViewControllerAnimated(true, completion: nil)
}
}
