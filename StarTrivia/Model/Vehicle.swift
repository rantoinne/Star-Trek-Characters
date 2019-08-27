//
//  Vehicle.swift
//  StarTrivia
//
//  Created by Ravi on 26/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import Foundation

struct Vehicle : Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let speed: String
    let crew: String
    let passengers: String
    let length: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case length
    }
}
