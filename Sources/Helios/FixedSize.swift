//
//  FixedSize.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 17/02/2020.
//  Copyright © 2020 Przemyslaw Bobak. All rights reserved.
//

import UIKit

@propertyWrapper
public struct FixedSize<T: UIView>: HeliosWrapper {
    public var wrappedValue: T {
        didSet {
            setConstraints()
        }
    }

    public var width: CGFloat
    public var height: CGFloat?
    public var cornerRadius: CGFloat?

    /// Initialize with a given width constraint
    ///
    /// - Parameters:
    ///   - wrappedValue: Instance of a UIView to which a width constraint will be applied to
    ///   - width: A specified width value
    public init(wrappedValue: T, _ width: CGFloat) {
        self.wrappedValue = wrappedValue
        self.width = width
        setConstraints()
    }

    internal func setConstraints() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        wrappedValue.widthAnchor.constraint(equalToConstant: width).isActive = true

        if let value = height {
            wrappedValue.heightAnchor.constraint(equalToConstant: value).isActive = true
        }
    }
}

extension FixedSize {
    public init(wrappedValue: T, _ width: CGFloat, _ height: CGFloat) {
        self.wrappedValue = wrappedValue
        self.width = width
        self.height = height
        setConstraints()
    }

    public init(wrappedValue: T, _ width: CGFloat, _ height: CGFloat, radius: CGFloat) {
        self.init(wrappedValue: wrappedValue, width, height)
        self.cornerRadius = radius
        applyCornerRadius()
    }
}
