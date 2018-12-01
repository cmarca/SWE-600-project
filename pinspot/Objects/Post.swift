//
//  Post.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class Post: NSObject {
    var picture: UIImage?
    var caption: String?
    var owner: User?
    var comments: [Comment]?
    var date: Date?
    var place: Place?
    var isPublic: Bool?
    var likes: [User]?
}
