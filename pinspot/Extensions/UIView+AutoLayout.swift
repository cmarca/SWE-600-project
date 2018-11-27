//
//  UIView+AutoLayout.swift
//  beisbol
//
//  Created by Carlos Marcano on 9/21/17.
//  Copyright © 2017 Carlos Marcano. All rights reserved.
//

import UIKit
import KGNAutoLayout

extension UIView {

    // Objective-C doesn't allow the priority to be an optional parameter, so we have
    // to have these methods as well if we want to use it in any Obj-C files. =( [clr]
    @discardableResult
    func pinToBottomEdgeOfSafeArea() -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let bottomSafeAreaConstraint = guide?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        bottomSafeAreaConstraint?.isActive = true
        return bottomSafeAreaConstraint
    }

    @discardableResult
    func pinToBottomEdgeOfSafeArea(withOffset offset: CGFloat = 0) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let bottomSafeAreaConstraint = guide?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: offset)
        bottomSafeAreaConstraint?.isActive = true
        return bottomSafeAreaConstraint
    }

    @discardableResult
    func pinToBottomEdgeOfSafeArea(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let bottomSafeAreaConstraint = guide?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: offset)
        if let priority = priority {
            bottomSafeAreaConstraint?.priority = priority
        }
        bottomSafeAreaConstraint?.isActive = true
        return bottomSafeAreaConstraint
    }

    @discardableResult
    func pinToTopEdgeOfSafeArea(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let topSafeAreaConstraint = guide?.topAnchor.constraint(equalTo: self.topAnchor, constant: -offset)
        if let priority = priority {
            topSafeAreaConstraint?.priority = priority
        }
        topSafeAreaConstraint?.isActive = true
        return topSafeAreaConstraint
    }

    @discardableResult
    func pinToRightEdgeOfSafeArea() -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let rightSafeAreaConstraint = guide?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0)
        rightSafeAreaConstraint?.isActive = true
        return rightSafeAreaConstraint
    }

    @discardableResult
    func pinToRightEdgeOfSafeArea(withOffset offset: CGFloat = 0) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let rightSafeAreaConstraint = guide?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: offset)
        rightSafeAreaConstraint?.isActive = true
        return rightSafeAreaConstraint
    }

    @discardableResult
    func pinToLeftEdgeOfSafeArea() -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let leftSafeAreaConstraint = guide?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0)
        leftSafeAreaConstraint?.isActive = true
        return leftSafeAreaConstraint
    }

    @discardableResult
    func pinToLeftEdgeOfSafeArea(withOffset offset: CGFloat = 0) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let leftSafeAreaConstraint = guide?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -offset)
        leftSafeAreaConstraint?.isActive = true
        return leftSafeAreaConstraint
    }

    @discardableResult
    func pinToEdgesOfSafeArea() -> [NSLayoutConstraint?] {
        assert(self.superview != nil, "Can't create constraints without a super view")
        var guide: AnyObject?
        if #available(iOS 11.0, *) {
            guide = self.superview?.safeAreaLayoutGuide
        } else {
            guide = self.superview
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        let bottomSafeAreaConstraint = guide?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        bottomSafeAreaConstraint?.isActive = true

        let topSafeAreaConstraint = guide?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0)
        topSafeAreaConstraint?.isActive = true

        let rightSafeAreaConstraint = guide?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0)
        rightSafeAreaConstraint?.isActive = true

        let leftSafeAreaConstraint = guide?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0)
        leftSafeAreaConstraint?.isActive = true
        
        return [bottomSafeAreaConstraint, topSafeAreaConstraint, rightSafeAreaConstraint, leftSafeAreaConstraint]
    }

}
