//
//  UIColor+Extension.swift
//  Subscriptions
//
//  Created by Parth Patel on 11/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

enum InterfaceStyle {
    case light
    case dark
}

//extension UIColor {
//    
//    static let destructiveColor = UIColor(red: 214/255, green: 40/255, blue: 40/255, alpha: 1.0)
//    static let warningColor = UIColor(red: 255/255, green: 190/255, blue: 11/255, alpha: 1.0)
//    
//    static var backgroundColor: UIColor {
//        return UIColor { (Collection) -> UIColor in
//            if Collection.userInterfaceStyle == .dark {
//                return UIColor.green.withAlphaComponent(0.6)
//            } else {
//                return UIColor.green.withAlphaComponent(0.9)
//            }
//        }
//    }
//}


@propertyWrapper
struct DynamicColor {
    let light: UIColor
    let dark: UIColor

    var wrappedValue: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return self.dark
                case .light, .unspecified:
                    return self.light
                @unknown default: return self.light
                }
            }
        } else {
            return light
        }
    }
}

struct Theme {
    @DynamicColor(light: .white, dark: .black)
    static var primaryTextColor: UIColor
    
    @DynamicColor(light: .black, dark: .white)
    static var labelTextColor: UIColor
}
