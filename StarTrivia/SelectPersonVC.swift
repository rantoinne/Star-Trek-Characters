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
    }

    @IBAction func randomClicked(_ sender: Any) {
        let randomNumber = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamo(id: randomNumber) { (person) in
            if let person = person {
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
                self.hairLbl.text = person.hair
            }
        }
    }
    
    
    @IBAction func homeworldClicked(_ sender: Any) {
    }
    
    @IBAction func vehiclesClicked(_ sender: Any) {
    }
    
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    
    @IBAction func filmsClicked(_ sender: Any) {
    }
    
}
