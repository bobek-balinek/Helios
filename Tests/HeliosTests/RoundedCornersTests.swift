//
//  RoundedCornersTests.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

final class RoundedCornersTests: XCTestCase {
    static let radius: CGFloat = 25

    @RoundedCorners(radius) var cornerRadiusView: UIView = UIView()

    func testCornerRadius() {
        XCTAssertEqual(cornerRadiusView.layer.masksToBounds, true)
        XCTAssertEqual(cornerRadiusView.layer.cornerRadius, RoundedCornersTests.radius)
    }

    static var allTests = [
        ("testCornerRadius", testCornerRadius)
    ]
}
