//
//  FixedSizeTests.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

internal class ExampleView: UIView {
    // Dummy View
}

final class FixedSizeTests: XCTestCase {
    static let constant: CGFloat = 50
    static let radius: CGFloat = 25

    @FixedSize(constant) var widthView: ExampleView = ExampleView()
    @FixedSize(constant, constant) var widthAndHeightView: ExampleView = ExampleView()
    @FixedSize(constant, constant, radius: radius) var cornerRadiusView: ExampleView = ExampleView()

    func testConstraints() {
        XCTAssertEqual(widthView.constraints.count, 1)
        XCTAssertEqual(widthAndHeightView.constraints.count, 2)
        XCTAssertEqual(cornerRadiusView.constraints.count, 2)
        XCTAssertEqual(widthView.constraints.first?.constant, FixedSizeTests.constant)
        XCTAssertEqual(widthView.constraints.first?.firstAttribute, NSLayoutConstraint.Attribute.width)

        XCTAssertEqual(widthAndHeightView.constraints.first?.constant, FixedSizeTests.constant)
        XCTAssertEqual(widthAndHeightView.constraints.last?.constant, FixedSizeTests.constant)
        XCTAssertEqual(widthAndHeightView.constraints.first?.firstAttribute, NSLayoutConstraint.Attribute.width)
        XCTAssertEqual(widthAndHeightView.constraints.last?.firstAttribute, NSLayoutConstraint.Attribute.height)

        XCTAssertEqual(cornerRadiusView.constraints.first?.constant, FixedSizeTests.constant)
        XCTAssertEqual(cornerRadiusView.constraints.last?.constant, FixedSizeTests.constant)
        XCTAssertEqual(cornerRadiusView.constraints.first?.firstAttribute, NSLayoutConstraint.Attribute.width)
        XCTAssertEqual(cornerRadiusView.constraints.last?.firstAttribute, NSLayoutConstraint.Attribute.height)
    }

    func testCornerRadius() {
        XCTAssertEqual(cornerRadiusView.layer.masksToBounds, true)
        XCTAssertEqual(cornerRadiusView.layer.cornerRadius, FixedSizeTests.radius)
    }

    static var allTests = [
        ("testConstraints", testConstraints),
        ("testCornerRadius", testCornerRadius)
    ]
}
