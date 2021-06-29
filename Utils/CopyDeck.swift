//
//  CopyDeck.swift
//  Subscriptions
//
//  Created by Parth Patel on 29/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//
import UIKit

func Localize(_ copyDeck: CopyDeck) -> String {
    let localizedString = copyDeck.rawValue.localiz()
    return localizedString
}

enum CopyDeck: String {
    case subscriptionText
    case editTitle
    
}
