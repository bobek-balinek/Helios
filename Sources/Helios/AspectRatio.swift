//
//  AspectRatio.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

@propertyWrapper
public struct AspectRatio<T: UIView>: HeliosWrapper{
    public var wrappedValue: T {
        didSet {
            setConstraints()
        }
    }
    public var aspectRatio: CGFloat
    public var cornerRadius: CGFloat?

    public init(wrappedValue: T, _ aspectRatio: CGFloat) {
        self.wrappedValue = wrappedValue
        self.aspectRatio = aspectRatio
        setConstraints()
    }

    internal func setConstraints() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        wrappedValue.heightAnchor.constraint(equalTo: wrappedValue.widthAnchor, multiplier: aspectRatio).isActive = true
    }
}

extension AspectRatio {
    public init(wrappedValue: T, _ aspectRatio: CGFloat, radius: CGFloat) {
        self.init(wrappedValue: wrappedValue, aspectRatio)
        self.cornerRadius = radius
        applyCornerRadius()
    }
}
