//
//  TextStyle.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

@propertyWrapper
struct TextStyle<T: UILabel>: HeliosLabelWrapper {
    var wrappedValue: T {
        didSet {
            setFontStyle()
        }
    }

    var textStyle: UIFont.TextStyle
    var fontTraits: [UIFontDescriptor.SymbolicTraits]?
    var textAlignment: NSTextAlignment?
    var textColor: UIColor?

    init(wrappedValue: T, _ textStyle: UIFont.TextStyle) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        setFontStyle()
    }

    func setFontStyle() {
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
    init(wrappedValue: T, _ textStyle: UIFont.TextStyle, color: UIColor) {
        self.init(wrappedValue: wrappedValue, textStyle)
        self.textColor = color
        applyTextStyles()
    }

    init(wrappedValue: T, _ textStyle: UIFont.TextStyle, alignment: NSTextAlignment) {
        self.init(wrappedValue: wrappedValue, textStyle)
        self.textAlignment = alignment
        applyTextStyles()
    }

    init(wrappedValue: T, _ textStyle: UIFont.TextStyle, fontTraits: [UIFontDescriptor.SymbolicTraits]) {
        self.wrappedValue = wrappedValue
        self.textStyle = textStyle
        self.fontTraits = fontTraits
        setFontStyle()
    }

    init(wrappedValue: T, _ textStyle: UIFont.TextStyle, color: UIColor, alignment: NSTextAlignment) {
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
