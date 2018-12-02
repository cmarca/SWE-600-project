//
//  AttributedString.swift
//  beisbol
//
//  Created by Carlos Marcano on 10/9/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class AttributedString: NSObject {

    static func prefixString(prefix: String, value: String) -> NSAttributedString {

        let prefixAttribute = [ NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1),
                                NSAttributedString.Key.foregroundColor: Style.Color.black ]
        let prefixAttrString = NSAttributedString(string: prefix, attributes: prefixAttribute)

        let descriptionAttribute = [  NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1),
                                      NSAttributedString.Key.foregroundColor: Style.Color.dimBlack ]
        let descriptionAttrString = NSAttributedString(string: " \(value)", attributes: descriptionAttribute)

        let attributedString = NSMutableAttributedString(attributedString: prefixAttrString)
        attributedString.append(descriptionAttrString)
        return attributedString
    }

}
