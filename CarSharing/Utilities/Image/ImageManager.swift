//
//  ImageManager.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 29/11/2021.
//

import Foundation
import UIKit



/// Extension that provides the images to be used all over the mobile app.
/// based on the `Assets` assets catalog.


public extension UIImage {

    /// Enum for the image names that matches images available in the assets catalog
    enum ImageName: String {

        case SplashScreen
            }
    
    
    /** Initialize image with provided name */
    convenience init(_ name: ImageName) {
        // try to load color from name, in provided bundle
        let namedImage = UIImage(named: name.rawValue)
        if namedImage == nil {
            print("[ImagesManager] init(name:in), cannot find image named: \(name.rawValue)")
        }
        self.init(named: name.rawValue)!
    }

}
