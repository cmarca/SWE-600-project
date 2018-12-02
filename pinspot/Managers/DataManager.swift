//
//  DataManager.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import RxSwift

class DataManager: NSObject {

    static let shared = DataManager()

    var posts: Variable<[Post]?> = Variable(nil)

    override init() {
        super.init()
        self.setupPosts()
    }

    func setupPosts() {
        self.posts.value = PostFactory.randomPosts()
    }
}
