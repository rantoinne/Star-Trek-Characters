//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Ravi on 22/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        prevBtn.isEnabled = false
        guard let firstStarship = starships.first else {return }
        getStarships(url: firstStarship)
    }
    
    func getStarships(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupUI(starship: starship)
            }
        }
    }
    
    func setupUI(starship: Starship) {
        nameLbl.text = starship.name
        costLbl.text = starship.cost
        makerLbl.text = starship.manufacturer
        modelLbl.text = starship.model
    }
    
    @IBAction func prevClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        prevBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarships(url: starships[currentStarship])
    }
}
