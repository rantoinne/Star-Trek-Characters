//
//  FadeEnabledButton.swift
//  StarTrivia
//
//  Created by Ravi on 22/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.4) {
                    self.alpha = 1.0
                }
            }
            else {
                UIView.animate(withDuration: 0.4) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
