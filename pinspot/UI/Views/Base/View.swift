//
//  View.swift
//  beisbol
//
//  Created by Carlos Marcano on 9/20/17.
//  Copyright © 2017 Carlos Marcano. All rights reserved.
//

import UIKit

open class View: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    open func setup() {
    }

}

extension UIView {
    static func wrapper(for view: UIView, withOffset: CGFloat? = Style.Size.smallPadding) -> UIView {
        let wrapperView = UIView()
        wrapperView.clipsToBounds = false

        let backgroundView = UIView()
        backgroundView.backgroundColor = Style.Color.white
        wrapperView.addSubview(backgroundView)
        backgroundView.pinToEdgesOfSuperview(withOffset: Style.Size.smallPadding)
        backgroundView.layer.cornerRadius = Style.Size.smallCornerRadius
        backgroundView.layer.shadowColor = Style.Color.dimBlack.cgColor
        backgroundView.layer.shadowRadius = 5.0
        backgroundView.layer.shadowOpacity = 0.1
        backgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

        wrapperView.addSubview(view)
        view.pinToEdgesOfSuperview(withOffset: Style.Size.smallPadding + Style.Size.smallCornerRadius / 2.0)

        return wrapperView
    }

    func reduceShadowForAnimation() {
        if let layerShadow = self.subviews.first?.layer {
            if layerShadow.shadowRadius == 5.0 {
                self.layer.shadowRadius = 1.0
                self.layer.shadowColor = UIColor.red.cgColor
            }
        }
    }
    func restoreShadowForAnimation() {
        if let layerShadow = self.superview?.layer {
            if layerShadow.shadowRadius == 1.0 {
                self.layer.shadowRadius = 5.0
                self.layer.shadowColor = Style.Color.dimBlack.cgColor
            }
        }
    }
}
