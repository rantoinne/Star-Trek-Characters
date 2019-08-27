//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Ravi on 22/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {

    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(person)")
    }
}
