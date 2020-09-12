//
//  Margins+Extension.swift
//  Subscriptions
//
//  Created by Parth Patel on 11/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

public extension CGFloat {
    static let tightMargin: CGFloat = 4
    static let standardMargin: CGFloat = 8
    static let mediumMargin: CGFloat = 12
    static let wideMargin: CGFloat = 16
    static let extraWideMargin: CGFloat = 20
}

public extension UIEdgeInsets {
    init(uniform: CGFloat) {
        self.init(top: uniform, left: uniform, bottom: uniform, right: uniform)
    }
    
    static let tightMargin: UIEdgeInsets = .init(uniform: .tightMargin)
    static let standardMargin: UIEdgeInsets = .init(uniform: .standardMargin)
    static let mediumMargin: UIEdgeInsets = .init(uniform: .mediumMargin)
    static let wideMargin: UIEdgeInsets = .init(uniform: .wideMargin)
    static let extraWideMargin: UIEdgeInsets = .init(uniform: .extraWideMargin)
}
