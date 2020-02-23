//
//  FontSize.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

@propertyWrapper
public struct FontSize<T: UILabel>: HeliosLabelWrapper {
    public var wrappedValue: T {
        didSet {
            setFontStyle()
        }
    }

    public var fontSize: CGFloat
    public var fontWeight: UIFont.Weight?
    public var textAlignment: NSTextAlignment?
    public var textColor: UIColor?

    public init(wrappedValue: T, _ size: CGFloat) {
        self.wrappedValue = wrappedValue
        self.fontSize = size
        setFontStyle()
    }

    internal func setFontStyle() {
        wrappedValue.font = styledFont()
        wrappedValue.adjustsFontForContentSizeCategory = true
        wrappedValue.numberOfLines = 0
    }

    internal func styledFont() -> UIFont {
        guard let weight = fontWeight else {
            return .systemFont(ofSize: fontSize)
        }

        return .systemFont(ofSize: fontSize, weight: weight)
    }
}

extension FontSize {
    public init(wrappedValue: T, _ size: CGFloat, weight: UIFont.Weight) {
        self.init(wrappedValue: wrappedValue, size)
        self.fontWeight = weight
        setFontStyle()
        applyTextStyles()
    }

    public init(wrappedValue: T, _ size: CGFloat, color: UIColor) {
        self.init(wrappedValue: wrappedValue, size)
        self.textColor = color
        applyTextStyles()
    }

    public init(wrappedValue: T, _ size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.init(wrappedValue: wrappedValue, size)
        self.fontWeight = weight
        self.textColor = color
        setFontStyle()
        applyTextStyles()
    }

    public init(wrappedValue: T, _ size: CGFloat, alignment: NSTextAlignment) {
        self.init(wrappedValue: wrappedValue, size)
        self.textAlignment = alignment
        applyTextStyles()
    }

    public init(wrappedValue: T, _ size: CGFloat, weight: UIFont.Weight, color: UIColor, alignment: NSTextAlignment) {
        self.init(wrappedValue: wrappedValue, size)
        self.fontWeight = weight
        self.textColor = color
        self.textAlignment = alignment
        setFontStyle()
        applyTextStyles()
    }
}
