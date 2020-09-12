//
//  LogDateFormatter.swift
//  Subscriptions
//
//  Created by Parth Patel on 08/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

public final class LogDateFormatter: DateFormatter {
    convenience init(dateFormat: String = "yyyy-MM-dd HH:mm:ssSSS") {
        self.init()
        self.dateFormat = dateFormat
        self.locale = Locale.current
        self.timeZone = TimeZone.current
    }
}

extension DateFormatter {
    func getCurrentDateAsString() -> String {
        return self.string(from: Date())
    }
}
