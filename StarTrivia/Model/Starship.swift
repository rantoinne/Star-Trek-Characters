//
//  Starship.swift
//  StarTrivia
//
//  Created by Ravi on 27/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import Foundation

struct Starship : Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
    }
}
