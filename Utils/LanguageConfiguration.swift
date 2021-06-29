//
//  LanguageConfiguration.swift
//  Subscriptions
//
//  Created by Parth Patel on 29/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation
import LanguageManager_iOS

class LanguageConfiguration {
    init() {
        LanguageManager.shared.setLanguage(language: .deviceLanguage)
        Logger.log("Current language = \(LanguageManager.shared.currentLanguage)")
    }
}
