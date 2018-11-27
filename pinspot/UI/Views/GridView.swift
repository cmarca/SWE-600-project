//
//  GridView.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class GridView: View {

    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(width: Style.Size.control, height: Style.Size.control)
        flowLayout.minimumInteritemSpacing = Style.Size.smallPadding
        flowLayout.minimumLineSpacing = Style.Size.smallPadding
        flowLayout.headerReferenceSize = CGSize(width: Style.Size.control, height: Style.Size.control * 2.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = Style.Color.white
        collectionView.register(GridViewCell.self, forCellWithReuseIdentifier: GridViewCell.reuseIdentifier())
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 30.0 + Style.Size.padding * 2.0, right: 0.0)
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
}

extension GridView: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 3...40)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridViewCell.reuseIdentifier(), for: indexPath) as? GridViewCell else {
            fatalError()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didTapOn()
    }
}

class GridViewCell: CollectionViewCell {

    override func setup() {
        self.backgroundColor = Style.Color.random(alpha: 0.2)
    }
}
