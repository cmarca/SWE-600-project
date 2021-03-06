//
//  ExploreViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import KGNAutoLayout
import RxSwift

class ExploreViewController: UIViewController {

    var posts: [Post]? {
        didSet {
            self.mapView.posts = self.posts
            self.gridView.posts = self.posts
        }
    }

    var mapView = MapView()
    var gridView = GridView()

    let disposeBag = DisposeBag()

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
        self.mapView.delegate = self

        self.view.addSubview(self.segmentedControl)
        self.segmentedControl.pinToBottomEdgeOfSuperview(withOffset: Style.Size.padding)
        self.segmentedControl.pinToSideEdgesOfSuperview(withOffset: Style.Size.padding)

//        self.posts = DataManager.shared.posts.value
        self.setupReactiveUI()
    }

    private func setupReactiveUI() {
        DataManager.shared.posts.asObservable().subscribe(onNext: { [weak self] (posts) in
            self?.posts = posts
        }).disposed(by: self.disposeBag)
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
    func didTapOn(post: Post) {
        let detailViewController = DetailViewController()
        detailViewController.post = post
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
