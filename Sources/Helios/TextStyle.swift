//
//  TextStyle.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

@propertyWrapper
public struct TextStyle<T: UILabel>: HeliosLabelWrapper {
    public var wrappedValue: T {
        didSet {
            setFontStyle()
        }
    }

    public var textStyle: UIFont.TextStyle
    public var fontTraits: [UIFontDescriptor.SymbolicTraits]?
    public var textAlignment: NSTextAlignment?
    public var textColor: UIColor?

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        setFontStyle()
    }

    internal func setFontStyle() {
        wrappedValue.font = styledFont()
        wrappedValue.adjustsFontForContentSizeCategory = true
        wrappedValue.numberOfLines = 0
    }

    internal func styledFont() -> UIFont {
        let preferredFont = UIFont.preferredFont(forTextStyle: textStyle)

        guard
            let traits = fontTraits,
            let descriptor = preferredFont.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) else {
            return preferredFont
        }

        return UIFont(descriptor: descriptor, size: 0)
    }
}

extension TextStyle {
    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, color: UIColor) {
        self.init(wrappedValue: wrappedValue, textStyle)
        self.textColor = color
        applyTextStyles()
    }

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, alignment: NSTextAlignment) {
        self.init(wrappedValue: wrappedValue, textStyle)
        self.textAlignment = alignment
        applyTextStyles()
    }

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, fontTraits: [UIFontDescriptor.SymbolicTraits]) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        self.fontTraits = fontTraits
        setFontStyle()
    }

    public init(wrappedValue: T, _ textStyle: UIFont.TextStyle, color: UIColor, alignment: NSTextAlignment) {
        self.init(wrappedValue: wrappedValue, textStyle)
        self.textColor = color
        self.textAlignment = alignment
        applyTextStyles()
    }

    init(
        wrappedValue: T,
        _ textStyle: UIFont.TextStyle,
        color: UIColor,
        alignment: NSTextAlignment,
        fontTraits: [UIFontDescriptor.SymbolicTraits]
    ) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        self.textColor = color
        self.textAlignment = alignment
        self.fontTraits = fontTraits
        setFontStyle()
        applyTextStyles()
    }
}
