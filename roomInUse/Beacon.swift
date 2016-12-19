//
//  Beacon.swift
//  roomInUse
//
//  Created by Fiona Carty on 12/19/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit

// minor values :
// mint - 4884
// icy blue - 39702
// blueberry pi - 1103

// MARK: OLD data model from estimote starter
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

// MARK: NEW data model
class Beacon {
    
    enum estimote {
        case mint
        case icyblue
        case blueberrypi
        
    }
    
    switch beaconName: String {
        case .mint = "mint"
        case .icyblue = "icy blue"
        case .blueberrypi = "blueberry pi"
    }
    
    switch suiteName: String {
        case .mint = "Suite 1"
        case .icyblue = "Suite 2"
        case .blueberrypi = "Suite 3"
    }
    
    switch minorVal: Int {
        case .mint : 4884
        case .icyblue : 39702
        case .blueberrypi : 1103
    }
    
}


