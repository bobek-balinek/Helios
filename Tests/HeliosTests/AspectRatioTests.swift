//
//  RoundedCorners.swift
//  
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import XCTest
import UIKit
@testable import Helios

final class RoundedCornersTests: XCTestCase {
    @RoundedCorners(25) var cornerRadiusView: ExampleView = ExampleView()

    func testCornerRadius() {
        XCTAssertEqual(cornerRadiusView.layer.masksToBounds, true)
        XCTAssertEqual(cornerRadiusView.layer.cornerRadius, 25)
    }

    static var allTests = [
        ("testCornerRadius", testCornerRadius)
    ]
}

