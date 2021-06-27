//
//  AppDelegate.swift
//  Subscriptions
//
//  Created by Parth Patel on 08/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var router: AppRouter!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        AppRouter().start()
        return true
    }
    
    
}

extension AppDelegate {
    func setupLogging() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let logDateFormatter = LogDateFormatter(dateFormat: "yyyy-MM-dd HH:mm:ssSSS")
        LogService.register(provider: ConsoleLogProvider(dateFormatter: logDateFormatter))
        LogService.register(provider: FileLogProvider(dateFormatter: logDateFormatter, fileWriter: LogFileWriter(filePath: documentsPath + "/TodoAppLog.txt")))
    }
}
