//
//  Button.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/2/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class Button: NSObject {

    static func solidButton() -> UIButton {
        let loginButton = UIButton(type: UIButton.ButtonType.system)
        loginButton.backgroundColor = Style.Color.pinspot
        loginButton.setTitleColor(Style.Color.white, for: .normal)
        loginButton.layer.cornerRadius = Style.Size.cornerRadius
        return loginButton
    }

}
