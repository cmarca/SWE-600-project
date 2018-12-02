//
//  Post.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import MapKit

class Post: NSObject, MKAnnotation {
    var picture: UIImage?
    var thumbnail: UIImage?
    var caption: String?
    var owner: User?
    var comments: [Comment]?
    var date: Date?
    var place: Place?
    var isPublic: Bool?
    var likes: [User]?

//    var title: String? {
//        get {
//            return self.owner?.userName
//        }
//    }
//
//    var subtitle: String? {
//        get {
//            return self.caption
//        }
//    }

    var coordinate: CLLocationCoordinate2D {
        get {
            return self.place?.location ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        }
    }
}
