//
//  Place.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import CoreLocation

class Place: NSObject {
    var name: String?
    var location: CLLocation?
    var posts: [Post]?
}
