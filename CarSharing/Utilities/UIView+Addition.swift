//
//  UIView+Addition.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import Foundation
import  UIKit

/** add additional view functions to the current UIView */
extension UIView {
    
    /** Combine two colors into a viewBackgroundColor  */
    func CustomBackgroundColor() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.perfectSky.cgColor, UIColor.coldLips.cgColor]
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at:0)
    }
    
}
