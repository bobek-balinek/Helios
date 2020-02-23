//
//  TextStyleTests.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

final class TextStyleTests: XCTestCase {
    static let font: UIFont.TextStyle = .body
    static let textColor: UIColor = UIColor.red
    static let textAlignment: NSTextAlignment = .right

    @TextStyle(font) var label: UILabel = UILabel()
    @TextStyle(font, color: textColor) var coloredLabel: UILabel = UILabel()
    @TextStyle(font, alignment: textAlignment) var alignedLabel: UILabel = UILabel()

    func testFontStyle() {
        XCTAssertEqual(label.adjustsFontForContentSizeCategory, true)
        XCTAssertEqual(label.font.pointSize, UIFont.preferredFont(forTextStyle: .body).pointSize)
    }

    func testTextColor() {
        XCTAssertEqual(coloredLabel.textColor, TextStyleTests.textColor)
    }

    func testTextAlignment() {
        XCTAssertEqual(alignedLabel.textAlignment, TextStyleTests.textAlignment)
    }

    static var allTests = [
        ("testFontStyle", testFontStyle),
        ("testTextColor", testTextColor),
        ("testTextAlignment", testTextAlignment)
    ]
}
