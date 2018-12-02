//
//  AvatarView.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/2/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class AvatarView: View {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func setup() {
        self.addSubview(self.imageView)
        self.imageView.pinToEdgesOfSuperview()
        self.imageView.size(toWidth: Style.Size.smallControl)
        self.imageView.size(toHeight: Style.Size.smallControl)

        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = Style.Size.smallControl / 2.0
    }

}
