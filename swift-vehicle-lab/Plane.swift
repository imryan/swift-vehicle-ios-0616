//
//  Plane.swift
//  swift-vehicle-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane: Vehicle {
    
    let maxAltitude: Double
    var altitude: Double = 0
    
    var inFlight: Bool {
        return (speed > 0 && altitude > 0)
    }
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    // MARK: Functionality
    
    func takeoff() {
        if (speed == 0 && altitude == 0) {
            speed += (maxSpeed * 0.1)
            altitude += (maxAltitude * 0.1)
        }
    }
    
    func land() {
        speed = 0
        altitude = 0
    }
    
    func climb() {
        if (inFlight) {
            let potentialAltitude = altitude + (maxAltitude * 0.1)
            
            if (potentialAltitude <= maxAltitude) {
                altitude = potentialAltitude
                speed = (maxSpeed * 0.4)
            }
        }
    }
    
    func dive() {
        if (speed >= 0) {
            let potentialAltitude = altitude - (maxAltitude * 0.1)
            
            if (potentialAltitude >= 0) {
                altitude = potentialAltitude
                
                if (speed == 0) {
                    speed += (maxSpeed * 0.1)
                } else {
                    speed = (maxSpeed * 0.6)
                }
            }
        }
    }
    
    func bankRight() {
        if (inFlight) {
            if (heading == 360) {
                heading = 0
            }
            
            heading += 45
            speed -= (speed * 0.1)
            
            if (heading == 360) {
                heading = 0
            }
        }
    }
    
    func bankLeft() {
        if (inFlight) {
            if (heading < 90) {
                heading = 360 - (45 - heading)
            } else {
                heading -= 45
            }
            
            speed -= (speed * 0.1)
        }
    }
}