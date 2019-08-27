//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Ravi on 22/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {

    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        prevBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupUI(vehicle: vehicle)
            }
        }
    }
    
    func setupUI(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        manufacturerLbl.text = vehicle.manufacturer
        modelLbl.text = vehicle.model
        lengthLbl.text = vehicle.length
        costLbl.text = vehicle.cost
        passengersLbl.text = vehicle.passengers
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
    }
    
    
    @IBAction func prevClick(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        prevBtn.isEnabled = currentVehicle == 0 ? false : true
        
//        if currentVehicle == 0 {
//            prevBtn.isEnabled = false
//        } else {
//            prevBtn.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//             nextBtn.isEnabled = true
//        }
        getVehicle(url: vehicles[currentVehicle])
    }
    
}
