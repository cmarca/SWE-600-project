//
//  PostViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit


class PostViewController: UIViewController {

    let pictureView: UIView = {
        let pictureView = UIView()
        pictureView.backgroundColor = Style.Color.random(alpha: 0.2)
        return pictureView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Style.Color.white

        self.view.addSubview(self.pictureView)
        self.pictureView.pinToTopEdgeOfSuperview()
        self.pictureView.pinToSideEdgesOfSuperview()
        self.pictureView.size(toHeight: 350.0)
    }

}
