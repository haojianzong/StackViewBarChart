//
//  UIColor+Percentage.swift
//  zhiwo
//
//  Created by Jake on 8/11/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    /// from a color to another color by percentage
    /// https://stackoverflow.com/a/46729248
    func toColor(_ color: UIColor, percentage: CGFloat) -> UIColor {
        let percentage = max(min(percentage, 1), 0)
        switch percentage {
        case 0: return self
        case 1: return color
        default:
            var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
            guard color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }

            return UIColor(red: CGFloat(r1 + (r2 - r1) * percentage),
                           green: CGFloat(g1 + (g2 - g1) * percentage),
                           blue: CGFloat(b1 + (b2 - b1) * percentage),
                           alpha: CGFloat(a1 + (a2 - a1) * percentage))
        }
    }
}
