//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class BGView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBGButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
