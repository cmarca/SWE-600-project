//
//  InputFieldView.swift
//  pinspot
//
//  Created by Carlos Marcano on 12/1/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class InputFieldView: View {

    var placeholder: String? {
        didSet {
            self.field.placeholder = self.placeholder
        }
    }

    var isSecureTextEntry: Bool? {
        didSet {
            if let isSecureTextEntry = self.isSecureTextEntry {
                self.field.isSecureTextEntry = isSecureTextEntry
            }
        }
    }

    let field: UITextField = {
        let field = UITextField(frame: .zero)
        field.borderStyle = .none
        return field
    }()

    let line: UIView = {
        let view = UIView()
        view.backgroundColor = Style.Color.dimBlack
        return view
    }()

    override func setup() {
        self.addSubview(self.field)
        self.field.pinToEdgesOfSuperview()

        self.addSubview(self.line)
        self.line.pinToSideEdgesOfSuperview()
        self.line.pinToBottomEdgeOfSuperview()
        self.line.size(toHeight: Style.Size.onePixel)
    }

}
