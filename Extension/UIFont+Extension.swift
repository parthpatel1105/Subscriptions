//
//  UIFont+Extension.swift
//  Subscriptions
//
//  Created by Parth Patel on 11/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

extension UIFont {
    static let titleExtraLarge: UIFont = font(ofSize: 34, weight: .semibold)
    
    static let titleLarge: UIFont = font(ofSize: 24, weight: .semibold)
    static let subtitleLarge: UIFont = font(ofSize: 24, weight: .regular)
    
    static let title: UIFont = font(ofSize: 18, weight: .semibold)
    static let subtitle: UIFont = font(ofSize: 18, weight: .regular)
    
    static let headline: UIFont = font(ofSize: 16, weight: .semibold)
    static let body: UIFont = font(ofSize: 16, weight: .regular)
    
    static let headlineSmall: UIFont = font(ofSize: 14, weight: .semibold)
    static let bodySmall: UIFont = font(ofSize: 14, weight: .regular)
    
    static let caption: UIFont = font(ofSize: 12, weight: .semibold)
    static let footnote: UIFont = font(ofSize: 12, weight: .regular)
    
    private static func font(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return fontMetrics(forSize: size).scaledFont(for: .systemFont(ofSize: size, weight: weight))
    }
    
   private static func fontMetrics(forSize size: CGFloat) -> UIFontMetrics {
        switch size {
        case 34: return UIFontMetrics(forTextStyle: .largeTitle)
        case 24: return UIFontMetrics(forTextStyle: .title2)
        case 18: return UIFontMetrics(forTextStyle: .title3)
        case 14, 16: return UIFontMetrics(forTextStyle: .body)
        case 12: return UIFontMetrics(forTextStyle: .footnote)
        default: return UIFontMetrics.default
        }
    }
}

