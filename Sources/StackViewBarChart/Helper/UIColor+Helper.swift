//
//  UIColor+Helper.swift
//  zhiwo
//
//  Created by Jake on 8/13/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
