//
//  PostFactory.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import CoreLocation

class PostFactory: NSObject {

    static func randomPosts() -> [Post] {
        var posts = [Post]()
        for _ in 0...40 {
            posts.append(PostFactory.randomPost())
        }
        return posts
    }

    static func randomPost() -> Post {
        let post = Post()
        post.picture = PostFactory.randomImage()
        post.caption = PostFactory.randomCaption()
        post.owner = PostFactory.randomUser()
        post.comments = PostFactory.randomComments(4)
        post.date = Date()
        post.place = PostFactory.randomPlace()
        post.isPublic = true
        post.likes = PostFactory.randomUsers(2)
        return post
    }

    // MARK :- singles

    static func randomPlace() -> Place {
        let latitude = CLLocationDegrees(exactly: 37.3885491) ?? CLLocationDegrees()
        let longitude = CLLocationDegrees(exactly: -121.9323874) ?? CLLocationDegrees()
        let place = Place()
        place.name = Lorem.word
        place.location = CLLocation(latitude: latitude, longitude: longitude)
        return place
    }

    static func randomImage() -> UIImage {
        let randomInt = Int.random(in: 1...3)
        let randomString = String(format: "%03d", randomInt)
        guard let image = UIImage(named: "\(randomString)") else {
            return #imageLiteral(resourceName: "Pinspot")
        }
        return image
//        return #imageLiteral(resourceName: "Pinspot")
    }

    static func randomCaption() -> String {
        return Lorem.sentences(3)
    }

    static func randomUser() -> User {
        let user = User()
        user.realName = Lorem.fullName
        user.userName = Lorem.lastName
        return user
    }

    static func randomComment() -> Comment {
        let comment = Comment()
        comment.owner = PostFactory.randomUser()
        comment.date = Date()
        comment.text = Lorem.sentences(4)
        return comment
    }

    // MARK :- arrays

    static func randomComments(_ total: Int) -> [Comment] {
        var comments = [Comment]()
        for _ in 0..<total {
            comments.append(PostFactory.randomComment())
        }
        return comments
    }

    static func randomUsers(_ total: Int) -> [User] {
        return Array(repeating: PostFactory.randomUser(), count: total)
    }

}
