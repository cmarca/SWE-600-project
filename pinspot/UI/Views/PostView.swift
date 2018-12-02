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
                self.ownerLabel.text = username
            }

            self.avatarView.imageView.image = self.post?.owner?.profilePicture
        }
    }

    var avatarView: AvatarView = {
        let avatarView = AvatarView()
        return avatarView
    }()

    var ownerLabel = UILabel()

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

    var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "heart-off"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()

    var likeCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        label.textColor = Style.Color.black
        label.text = "4 likes"
        return label
    }()

    var commentsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        label.textColor = Style.Color.black
        label.text = "3 comments"
        return label
    }()

    override func setup() {
        self.clipsToBounds = true

        self.addSubview(self.avatarView)
        self.avatarView.pinToTopEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.avatarView.pinToLeftEdgeOfSuperview(withOffset: Style.Size.padding)

        self.addSubview(self.ownerLabel)
        self.ownerLabel.centerVertically(to: self.avatarView)
        self.ownerLabel.positionToTheRight(of: self.avatarView, withOffset: Style.Size.padding)
        self.ownerLabel.pinToRightEdgeOfSuperview()

        self.addSubview(self.picture)
        self.picture.positionBelow(self.avatarView, withOffset: Style.Size.padding)
        self.picture.pinToSideEdgesOfSuperview()
        self.picture.sizeHeightToWidth(withAspectRatio: 1.0)

        self.addSubview(self.likeButton)
        self.likeButton.positionBelow(self.picture, withOffset: Style.Size.padding)
        self.likeButton.pinToLeftEdgeOfSuperview(withOffset: Style.Size.padding)

        self.addSubview(self.likeCount)
        self.likeCount.centerVertically(to: self.likeButton)
        self.likeCount.positionToTheRight(of: self.likeButton, withOffset: Style.Size.smallPadding)
        self.likeCount.pinToRightEdgeOfSuperview()

        self.addSubview(self.caption)
        self.caption.positionBelow(self.likeButton, withOffset: Style.Size.padding)
        self.caption.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)

        self.addSubview(self.commentsCount)
        self.commentsCount.positionBelow(self.caption, withOffset: Style.Size.padding)
        self.commentsCount.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)
        self.commentsCount.pinToBottomEdgeOfSuperview()


        self.likeButton.addTarget(self, action: #selector(didTapLike(_:)), for: .touchUpInside)
    }

    @objc func didTapLike(_ button: UIButton) {
        self.likeCount.text = "5 likes"
        self.likeButton.setImage(#imageLiteral(resourceName: "heart-on"), for: .normal)
    }
}
