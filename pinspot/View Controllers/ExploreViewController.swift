//
//  ExploreViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import KGNAutoLayout

class ExploreViewController: UIViewController {

    var posts: [Post]? {
        didSet {
            self.gridView.posts = self.posts
        }
    }

    var mapView = MapView()
    var gridView = GridView()

    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Map", "List"])
        segmentedControl.backgroundColor = Style.Color.white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Style.Color.white

        self.view.addSubview(self.gridView)
        self.gridView.pinToEdgesOfSuperview()
        self.gridView.delegate = self

        self.view.addSubview(self.mapView)
        self.mapView.pinToEdgesOfSuperview()

        self.view.addSubview(self.segmentedControl)
        self.segmentedControl.pinToBottomEdgeOfSuperview(withOffset: Style.Size.padding)
        self.segmentedControl.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)

        self.posts = DataManager.shared.posts
    }

    @objc func didChangeValue(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            self.mapView.isHidden = false
            self.gridView.isHidden = true
        } else {
            self.mapView.isHidden = true
            self.gridView.isHidden = false
        }
    }
}

extension ExploreViewController: PostListingProtocol {
    func didTapOn() {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
}
