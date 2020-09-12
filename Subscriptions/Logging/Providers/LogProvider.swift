//
//  LogProvider.swift
//  Subscriptions
//
//  Created by Parth Patel on 08/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

public protocol LogProvider {
    func log(_ event: LogEvent, message: String, file: String, function: String, line: Int)
}
