//
//  ViewController.swift
//  roomInUse
//
//  Created by Fiona Carty on 12/17/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // minor values :
    // mint - 4884
    // icy blue - 39702
    // blueberry pi - 1103
    
    // MARK: identify the minor values of my beacons & associate a color to them.
    let colors = [
        4884: UIColor (red: 162/255, green: 213/255, blue: 181/255, alpha: 1), // mint
        39702: UIColor (red: 142/255, green: 212/255, blue: 220/255, alpha: 1), // icy blue
        1103: UIColor (red: 84/255, green: 77/255, blue: 160/255, alpha: 1) // blueberry pi
    ]
    
    let name = [
        4884: "mint",
        39702: "icy blue",
        1103: "blueberry pi"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D") as! UUID, identifier: "Estimotes")
        
        // MARK: if the request hasn't been authorized
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print(beacons)
        // MARK: new array that filters out all the unknown beacons
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            self.view.backgroundColor = self.colors[closestBeacon.minor.intValue]
            self.nameLabel.text = self.name[closestBeacon.minor.intValue]
            
        }
    }
    
}
