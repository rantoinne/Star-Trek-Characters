//
//  Person.swift
//  StarTrivia
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import Foundation

struct Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeWorldUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeWorldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
