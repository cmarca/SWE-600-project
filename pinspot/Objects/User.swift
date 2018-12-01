//
//  User.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class User: NSObject {
    var realName: String?
    var userName: String?
    var profilePicture: UIImage?
    var friends: [User]?
    var posts: [Post]?
}
