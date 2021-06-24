//
//  Storyboarded.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

enum Storyboard: String {
    case Main
    case OnBoarding
    case LoginView
    case VideoPlayList
}

protocol Storyboarded {
    static func instantiateStoryboard(_ type: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiateStoryboard(_ type: Storyboard) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: type.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
