//
//  RaceCar.swift
//  swift-vehicle-lab
//
//  Created by Ryan Cohen on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class RaceCar: Car {
    
    let driver: String
    var sponsors: [String]
    
    init(name: String, weight: Double, maxSpeed: Double,
         transmission: String, cylinders: Int,
         milesPerGallon: Double, driver: String, sponsors: [String]) {
        
        self.driver = driver
        self.sponsors = sponsors
        
        super.init(name: name, weight: weight, maxSpeed: maxSpeed, transmission: transmission, cylinders: cylinders, milesPerGallon: milesPerGallon)
    }
    
    // MARK: Functionality
    
    override func accelerate() {
        let potentialSpeed = speed + (maxSpeed * 0.2)
        
        if (potentialSpeed <= maxSpeed) {
            speed = potentialSpeed
        }
    }
    
    override func decelerate() {
        let potentialSpeed = speed - (maxSpeed * 0.2)
        
        if (potentialSpeed >= 0) {
            speed = potentialSpeed
        }
    }
    
    func driftRight() {
        if (speed > 0) {
            if (heading == 360) {
                heading = 0
            }
            
            heading += 90
            speed -= (speed * 0.25)
            
            if (heading == 360) {
                heading = 0
            }
        }
    }
    
    func driftLeft() {
        if (speed > 0) {
            if (heading < 90) {
                heading = 360 - (90 - heading)
            } else {
                heading -= 90
            }
            
            speed -= (speed * 0.25)
        }
    }
}