//
//  knConstraints.swift
//  knConstraints
//
//  Created by Ky Nguyen on 4/12/17.
//  Copyright © 2017 Ky Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
  
    @discardableResult
    public func left(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }
 
    @discardableResult
    public func right(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func top(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func topLeft(toView view: UIView, top: CGFloat = 0, left: CGFloat = 0, isActive: Bool = true)
        -> (top: NSLayoutConstraint, left: NSLayoutConstraint) {
            let topConstraint = self.top(toView: view, space: top)
            let leftConstraint = self.left(toView: view, space: left)
            return (topConstraint, leftConstraint)
    }
 
    @discardableResult
    public func bottomLeft(toView view: UIView, bottom: CGFloat = 0, left: CGFloat = 0)
        -> (bottom: NSLayoutConstraint, left: NSLayoutConstraint) {
            let bottomConstraint = self.bottom(toView: view, space: bottom)
            let leftConstraint = self.left(toView: view, space: left)
            return (bottomConstraint, leftConstraint)
    }
 
    @discardableResult
    public func bottom(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func verticalSpacing(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }
 
    @discardableResult
    public func horizontalSpacing(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.leftAnchor, constant: -space)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func leftHorizontalSpacing(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.rightAnchor, constant: -space)
        constraint.isActive = isActive
        return constraint
    }
    
    
    
    public func size(_ size: CGSize) {
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }

    public func square(edge: CGFloat) {
        size(CGSize(width: edge, height: edge))
    }
    
    public func square() {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0).isActive = true
    }
 
    @discardableResult
    public func height(_ height: CGFloat, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func centerX(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    public func center(toView view: UIView, spaceX: CGFloat = 0,
                       spaceY: CGFloat = 0){
        centerX(toView: view, space: spaceX)
        centerY(toView: view, space: spaceY)
    }
    
    @discardableResult
    public func centerY(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }
 
    @discardableResult
    public func horizontal(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) ->
        (left: NSLayoutConstraint, right: NSLayoutConstraint) {
            let left = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
            left.priority = UILayoutPriority(rawValue: 999)
            left.isActive = isActive
            let right = rightAnchor.constraint(equalTo: view.rightAnchor, constant: -space)
            right.isActive = isActive
            return (left, right)
    }
    
    @discardableResult
    public func horizontal(toView view: UIView, leftPadding: CGFloat, rightPadding: CGFloat, isActive: Bool = true)
        -> (left: NSLayoutConstraint, right: NSLayoutConstraint) {
            let left = leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftPadding)
            left.isActive = isActive
            let right = rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightPadding)
            right.isActive = isActive
            return (left, right)
    }
    
    @discardableResult
    public func fill(toView view: UIView, space: UIEdgeInsets = .zero, isActive: Bool = true)
        -> (left: NSLayoutConstraint, top: NSLayoutConstraint,
        right: NSLayoutConstraint, bottom: NSLayoutConstraint) {
            let leftCons = left(toView: view, space: space.left, isActive: isActive)
            let rightCons = right(toView: view, space: -space.right, isActive: isActive)
            let topCons = top(toView: view, space: space.top, isActive: isActive)
            let bottomCons = bottom(toView: view, space: -space.bottom, isActive: isActive)
            return (leftCons, topCons, rightCons, bottomCons)
    }
}

extension UIEdgeInsets {
    init(space: CGFloat) {
        self.init(top: space, left: space, bottom: space, right: space)
    }
    
    init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.init()
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}
