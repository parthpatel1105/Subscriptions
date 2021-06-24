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
  
//        let onBoardingView = ViewController.instantiateStoryboard(.Main)
//        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: onBoardingView)
//        UIApplication.shared.windows.first?.makeKeyAndVisible()

        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        if let window = window {
//            router = AppRouter(window: window, navigationController: UINavigationController())
//            router.start()
//        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
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
