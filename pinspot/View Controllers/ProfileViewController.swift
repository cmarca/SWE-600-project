//
//  ProfileViewController.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewController: UIViewController {

    var posts: [Post]? {
        didSet {
            self.gridView.posts = self.posts
        }
    }


    var avatarView: AvatarView = {
        let avatarView = AvatarView()
        avatarView.imageView.image = #imageLiteral(resourceName: "blank-profile-picture")
        return avatarView
    }()

    var ownerLabel = UILabel()
    
    var gridView = GridView()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Style.Color.white
        self.ownerLabel.text = Lorem.lastName

        self.view.addSubview(self.avatarView)
        self.avatarView.pinToTopEdgeOfSafeArea(withOffset: Style.Size.padding)
        self.avatarView.pinToLeftEdgeOfSuperview(withOffset: Style.Size.padding)

        self.view.addSubview(self.ownerLabel)
        self.ownerLabel.centerVertically(to: self.avatarView)
        self.ownerLabel.positionToTheRight(of: self.avatarView, withOffset: Style.Size.padding)
        self.ownerLabel.pinToRightEdgeOfSuperview()

        self.view.addSubview(self.gridView)
        self.gridView.positionBelow(self.avatarView, withOffset: Style.Size.padding)
        self.gridView.pinToSideEdgesOfSuperview()
        self.gridView.pinToBottomEdgeOfSuperview()
        self.gridView.delegate = self

        self.setupReactiveUI()
    }

    private func setupReactiveUI() {
        DataManager.shared.posts.asObservable().subscribe(onNext: { [weak self] (posts) in
            self?.posts = posts
        }).disposed(by: self.disposeBag)
    }
}

extension ProfileViewController: PostListingProtocol {
    func didTapOn(post: Post) {
        let detailViewController = DetailViewController()
        detailViewController.post = post
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
