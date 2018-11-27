//
//  CollectionViewCell.swift
//  beisbol
//
//  Created by Carlos Marcano on 10/11/17.
//  Copyright © 2017 Carlos Marcano. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    class func reuseIdentifier() -> String {
        return "\(self)"
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setup() {
    }
    
}
