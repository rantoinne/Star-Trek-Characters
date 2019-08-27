//
//  FilmsVC.swift
//  
//
//  Created by Ravi on 22/08/19.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {

    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(person.name)")
    }

}
