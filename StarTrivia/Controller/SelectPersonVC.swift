//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!

    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
    }

    @IBAction func randomClicked(_ sender: Any) {
        let randomNumber = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamo(id: randomNumber) { (person) in
            if let person = person {
                self.setupView(person: person)
                print("View Loaded \(person)")
            }
        }
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        hairLbl.text = person.hair
        
        homeworldBtn.isEnabled = !person.homeWorldUrl.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        
    }
    
}