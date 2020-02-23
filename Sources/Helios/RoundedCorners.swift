//
//  RoundedCorners.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

@propertyWrapper
public struct RoundedCorners<T: UIView>: HeliosWrapper {
    public var wrappedValue: T {
        didSet {
            applyCornerRadius()
        }
    }
    public var cornerRadius: CGFloat?

    public init(wrappedValue: T, _ cornerRadius: CGFloat) {
        self.wrappedValue = wrappedValue
        self.cornerRadius = cornerRadius
        applyCornerRadius()
    }
}
