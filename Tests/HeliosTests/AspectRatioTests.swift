//
//  AspectRatioTests.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

final class AspectRatioTests: XCTestCase {
    static let ratio: CGFloat = 1.5
    static let radius: CGFloat = 25

    @AspectRatio(ratio) var view: ExampleView = ExampleView()
    @AspectRatio(ratio, radius: radius) var roundedView: ExampleView = ExampleView()

    func testConstraints() {
        XCTAssertEqual(view.constraints.count, 1)
        XCTAssertEqual(view.constraints.first?.multiplier, AspectRatioTests.ratio)
        XCTAssertEqual(view.constraints.first?.firstAttribute, NSLayoutConstraint.Attribute.height)
        XCTAssertEqual(view.constraints.first?.secondAttribute, NSLayoutConstraint.Attribute.width)
    }

    func testCornerRadius() {
        XCTAssertEqual(roundedView.layer.masksToBounds, true)
        XCTAssertEqual(roundedView.layer.cornerRadius, AspectRatioTests.radius)
    }

    static var allTests = [
        ("testConstraints", testConstraints),
        ("testCornerRadius", testCornerRadius),
    ]
}
