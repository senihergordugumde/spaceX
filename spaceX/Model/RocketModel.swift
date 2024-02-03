//
//  RocketModel.swift
//  spaceX
//
//  Created by Emir AKSU on 2.02.2024.
//

import Foundation

struct RocketModel : Codable {
    
    
    let cost_per_launch : Int
    let success_rate_pct : Int
    let first_flight : String
    let country : String
    let company : String
    let wikipedia : String
    let description : String
    let rocket_name : String
    let height : height
    let diameter : diameter
    let mass : mass
    let flickr_images : [String]
}

struct height: Codable {
    
    let meters : Double
    let feet : Double
    
    
}

struct diameter: Codable {
    
    let meters : Double
    let feet : Double
    
    
}

struct mass: Codable {
    
    let kg : Int
    let lb : Int

}

