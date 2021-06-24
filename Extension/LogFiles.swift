//
//  LogFiles.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation

open class Logger {
    public class func log(_ message: String,
             _ file: String = #file,
             _ line: Int =  #line,
             _ function: String = #function) {
        #if DEBUG
            print("[\(file):\(line)] \(function) - \(message)")
        #endif
    }

    func foo() {
        Logger.log("Hello World")
    }

}
