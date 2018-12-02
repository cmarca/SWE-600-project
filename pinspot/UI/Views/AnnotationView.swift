//
//  AnnotationView.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let post = newValue as? Post else {
                return
            }
//            self.canShowCallout = true
//            self.calloutOffset = CGPoint(x: -5, y: 5)
//            self.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            self.image = post.thumbnail
        }
    }

    class func reuseIdentifier() -> String {
        return "\(self)"
    }

}
