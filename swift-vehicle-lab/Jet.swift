//
//  Jet.swift
//  swift-vehicle-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet: Plane {
    
    override func climb() {
        if (inFlight) {
            let potentialAltitude = altitude + (maxAltitude * 0.2)
            
            if (potentialAltitude <= maxAltitude) {
                altitude = potentialAltitude
                speed = (maxSpeed * 0.4)
            }
        }
    }
    
    override func dive() {
        if (inFlight) {
            let potentialAltitude = altitude - (maxAltitude * 0.2)
            
            if (potentialAltitude >= 0) {
                altitude = potentialAltitude
                speed = (maxSpeed * 0.6)
            }
        }
    }
    
    func afterburner() {
        if (inFlight && speed == maxSpeed) {
            speed = (maxSpeed * 2)
        }
    }
}