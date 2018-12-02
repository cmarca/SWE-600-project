//
//  PostView.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class PostView: View {

    var post: Post? {
        didSet {
            self.picture.image = self.post?.picture

            if let username = self.post?.owner?.userName,
                let text = self.post?.caption {
                let attributedText = AttributedString.prefixString(prefix: username, value: text)
                self.caption.attributedText = attributedText
            }
        }
    }

    var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var caption: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func setup() {
        self.clipsToBounds = true

        self.addSubview(self.picture)
        self.picture.pinToTopEdgeOfSafeArea()
        self.picture.pinToSideEdgesOfSuperview()
        self.picture.sizeHeightToWidth(withAspectRatio: 1.0)

        self.addSubview(self.caption)
        self.caption.positionBelow(self.picture, withOffset: Style.Size.padding)
        self.caption.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)
        self.caption.pinToBottomEdgeOfSuperview()
    }
}
