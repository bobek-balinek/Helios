//
//  HeliosWrapper.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

/// HeliosWrapper contains common properties and methods for package-wide behaviour
/// This includes an optional of adding corner radius to a given view
public protocol HeliosWrapper {
    associatedtype T

    var wrappedValue: T { get set }
    var cornerRadius: CGFloat? { get }
}

extension HeliosWrapper where T: UIView {
    public func applyCornerRadius() {
        if let value = cornerRadius {
            wrappedValue.layer.masksToBounds = true
            wrappedValue.layer.cornerRadius = value
        }
    }
}
