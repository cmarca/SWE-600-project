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
        post.thumbnail = PostFactory.thumbnail(image: post.picture)
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
    static func randomLocation() -> CLLocationCoordinate2D {
        let latitudeOffset = Double.random(in: -0.1...0.1)
        let latitudeDouble = 37.3885491 + latitudeOffset

        let longitudeOffset = Double.random(in: -0.1...0.1)
        let longitudeDouble = -121.9323874 + longitudeOffset

        let latitude = CLLocationDegrees(exactly: latitudeDouble) ?? CLLocationDegrees()
        let longitude = CLLocationDegrees(exactly: longitudeDouble) ?? CLLocationDegrees()
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static func randomPlace() -> Place {
         let place = Place()
        place.name = Lorem.word
        place.location = PostFactory.randomLocation()
        return place
    }

    static func randomImage() -> UIImage {
        let randomInt = Int.random(in: 1...3)
        let randomString = String(format: "%03d", randomInt)
        guard let image = UIImage(named: "\(randomString)") else {
            return #imageLiteral(resourceName: "Pinspot")
        }
        return image
    }

    static func randomCaption() -> String {
        return Lorem.sentences(3)
    }
    
    static func randomUser() -> User {
        let user = User()
        user.profilePicture = #imageLiteral(resourceName: "blank-profile-picture")
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

    // MARK :- helpers

    static func thumbnail(image: UIImage?) -> UIImage? {
        guard let image = image else {
            return nil
        }
        let imageData = image.pngData()
        let options = [
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceThumbnailMaxPixelSize: 50] as CFDictionary
        let tempData: NSMutableData = NSMutableData()
        imageData?.withUnsafeBytes {
            tempData.replaceBytes(in: NSMakeRange(0, imageData?.count ?? 0), withBytes: $0)
        }
        let unsafePointer: UnsafePointer? = tempData.bytes.assumingMemoryBound(to: UInt8.self)
        if let cfImageData = CFDataCreate(kCFAllocatorDefault, unsafePointer, imageData?.count ?? 0),
            let source = CGImageSourceCreateWithData(cfImageData, nil),
            let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options) {
            let thumbnail = UIImage(cgImage: imageReference)
            return thumbnail
        }
        return nil
    }
}
