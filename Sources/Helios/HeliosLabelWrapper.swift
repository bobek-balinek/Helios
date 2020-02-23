//
//  HeliosLabelWrapper.swift
//  Helios
//
//  Created by Przemyslaw Bobak on 23/02/2020.
//

import UIKit

public protocol HeliosLabelWrapper {
    associatedtype T

    var wrappedValue: T { get set }
    var textColor: UIColor? { get }
    var textAlignment: NSTextAlignment? { get }
}

extension HeliosLabelWrapper where T: UILabel {
    func applyTextStyles() {
        if let value = textAlignment {
            wrappedValue.textAlignment = value
        }

        if let value = textColor {
            wrappedValue.textColor = value
        }
    }
}
