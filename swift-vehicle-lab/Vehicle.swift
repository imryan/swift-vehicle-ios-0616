//
//  Vehicle.swift
//  swift-vehicle-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Vehicle {
    
    let name: String
    let weight: Double
    let maxSpeed: Double
    
    var speed: Double = 0
    var heading: Double = 0
    
    init(name: String, weight: Double, maxSpeed: Double) {
        self.name = name
        self.weight = weight
        self.maxSpeed = maxSpeed
    }
    
    // MARK: Functionality
    
    func goFast() {
        speed = maxSpeed
    }
    
    func halt() {
        speed = 0
    }
    
    func accelerate() {
        let potentialSpeed = speed + (maxSpeed * 0.1)
        
        if (potentialSpeed <= maxSpeed) {
            speed = potentialSpeed
        }
    }
    
    func decelerate() {
        let potentialSpeed = speed - (maxSpeed * 0.1)
        
        if (potentialSpeed >= 0) {
            speed = potentialSpeed
        }
    }
    
    func turnRight() {
        if (speed > 0) {
            if (heading == 360) {
                heading = 0
            }
            
            heading += 90
            speed /= 2
            
            if (heading == 360) {
                heading = 0
            }
        }
    }
 
    func turnLeft() {
        if (speed > 0) {
            speed /= 2
            
            if (heading < 90) {
                heading = 360 - (90 - heading)
            } else {
                heading -= 90
            }
        }
    }
}