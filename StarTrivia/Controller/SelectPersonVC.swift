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
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        loader.startAnimating()
        super.viewDidLoad()
        personApi.getRandomPersonAlamo(id: 1) { (person) in
            if let person = person {
                self.loader.stopAnimating()
                self.setupView(person: person)
                print("View Loaded \(person)")
                self.person = person
            }
        }
    }

    @IBAction func randomClicked(_ sender: Any) {
        loader.startAnimating()
        let randomNumber = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamo(id: randomNumber) { (person) in
            if let person = person {
                self.loader.stopAnimating()
                self.setupView(person: person)
                print("View Loaded \(person)")
                self.person = person
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
        
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeworldVC {
//                destination.person = person
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC {
//                destination.person = person
//            }
//        case Segue.starships.rawValue:
//            if let destination = segue.destination as? StarshipsVC {
//                destination.person = person
//            }
//        case Segue.films.rawValue:
//            if let destination = segue.destination as? FilmsVC {
//                destination.person = person
//            }
//        default:
//            break
//        }
    }
    
    enum Segue : String {
        case homeworld = "toHomeworld"
        case vehicles = "toVehicles"
        case films = "toFilms"
        case starships = "toStarships"
    }
    
}

protocol PersonProtocol {
    var person: Person! {get set}
}
