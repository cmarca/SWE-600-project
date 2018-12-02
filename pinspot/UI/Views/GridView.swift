//
//  GridView.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class GridView: View {

    var posts: [Post]? {
        didSet {
            self.processPosts(posts: posts)
        }
    }

    var processedPosts: [String: [Post]]?
    var dates = [
        "Today",
        "Yesterday",
        "2018-11-29",
        "2018-11-28",
        "2018-11-27",
        "2018-11-26",
    ]

    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: Style.Size.control, height: Style.Size.control)
        flowLayout.estimatedItemSize = CGSize(width: Style.Size.control, height: Style.Size.control)
        flowLayout.minimumInteritemSpacing = Style.Size.smallPadding
        flowLayout.minimumLineSpacing = Style.Size.smallPadding
        flowLayout.headerReferenceSize = CGSize(width: Style.Size.control, height: Style.Size.control * 2.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = Style.Color.white
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(GridViewCell.self, forCellWithReuseIdentifier: GridViewCell.reuseIdentifier())
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: Style.Size.smallPadding, bottom: 30.0 + Style.Size.padding * 2.0, right: Style.Size.smallPadding)
        return collectionView
    }()
    var delegate: PostListingProtocol?

    override func setup() {
        self.backgroundColor = Style.Color.white
        
        self.addSubview(self.collectionView)
        self.collectionView.pinToEdgesOfSuperview()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    func processPosts(posts: [Post]?) {
        guard let posts = posts else {
            return
        }

        var processedPosts = [String: [Post]]()
        for i in 0..<self.dates.count {
            let sectionTitle = self.dates[i]
            var sectionPosts = [Post]()
            let sectionSize = Int.random(in: 3...15)
            for _ in 0...sectionSize {
                if let randomPost = posts.randomElement() {
                    sectionPosts.append(randomPost)
                }
            }
            processedPosts[sectionTitle] = sectionPosts
        }

        self.processedPosts = processedPosts
        self.collectionView.reloadData()
    }
}

extension GridView: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.processedPosts?.keys.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = self.dates[section]
        return self.processedPosts?[key]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridViewCell.reuseIdentifier(), for: indexPath) as? GridViewCell else {
            fatalError()
        }
        let key = self.dates[indexPath.section]
        let section = self.processedPosts?[key]
        cell.post = section?[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let key = self.dates[indexPath.section]
        let section = self.processedPosts?[key]

        if let post = section?[indexPath.row] {
            self.delegate?.didTapOn(post: post)
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var v : UICollectionReusableView! = nil
        if kind == UICollectionView.elementKindSectionHeader {
            v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
            if v.subviews.count == 0 {
                v.addSubview(UILabel(frame: CGRect(x: 0, y: 25, width: 130, height: 30)))
            }
            let lab = v.subviews[0] as! UILabel
            let key = self.dates[indexPath.section]
            lab.text = key
            lab.textAlignment = .center
        }
        return v
    }
}

protocol PostListingProtocol {
    func didTapOn(post: Post)
}

class GridViewCell: CollectionViewCell {

    var post: Post? {
        didSet {
            self.imageView.image = self.post?.picture
        }
    }

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func setup() {
        self.backgroundColor = Style.Color.random(alpha: 0.2)
        self.contentView.addSubview(self.imageView)
        self.imageView.pinToEdgesOfSuperview()

        self.imageView.size(toWidth: Style.Size.control * 2.0)
        self.imageView.size(toHeight: Style.Size.control * 2.0)
        self.imageView.clipsToBounds = true

    }
}
