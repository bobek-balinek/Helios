//
//  FontSizeTests.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

final class FontSizeTests: XCTestCase {
    static let size: CGFloat = 21
    static let textColor: UIColor = UIColor.red
    static let textAlignment: NSTextAlignment = .right

    @FontSize(size) var label: UILabel = UILabel()
    @FontSize(size, color: textColor) var coloredLabel: UILabel = UILabel()
    @FontSize(size, alignment: textAlignment) var alignedLabel: UILabel = UILabel()

    func testFontStyle() {
        XCTAssertEqual(label.font.pointSize, FontSizeTests.size)
    }

    func testTextColor() {
        XCTAssertEqual(coloredLabel.textColor, FontSizeTests.textColor)
    }

    func testTextAlignment() {
        XCTAssertEqual(alignedLabel.textAlignment, FontSizeTests.textAlignment)
    }

    static var allTests = [
        ("testFontStyle", testFontStyle),
        ("testTextColor", testTextColor),
        ("testTextAlignment", testTextAlignment)
    ]
}
