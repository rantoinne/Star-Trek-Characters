//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Ravi on 22/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    var person: Person!
    let api = HomeworldApi()
    
    
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeWorldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUI(homeworld: homeworld)
            }
        }
    }
    
    func setupUI(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        populationLbl.text = homeworld.population
        terrainLbl.text = homeworld.terrain
        climateLbl.text = homeworld.climate
    }

}
