//
//  DetailViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var post: Post? {
        didSet {
            self.postView.post = self.post
        }
    }

    var postView = PostView()

    override func viewDidLoad() {
        self.view.backgroundColor = Style.Color.white

        self.view.addSubview(self.postView)
        self.postView.pinToTopEdgeOfSuperview()
        self.postView.pinToSideEdgesOfSuperview()

    }

}
