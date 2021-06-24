//
//  Router.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class AppRouter: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    // MARK: - Initialize Router
    internal init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }

    // MARK: - Start Routing
    
    func start() {
        //let onBoardingView = OnBoardingViewControllerView.instantiateStoryboard(.OnBoarding)
        let onBoardingView = ViewController.instantiateStoryboard(.Main)
//        navigationController.viewControllers = [onBoardingView]
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: onBoardingView)
        UIApplication.shared.windows.first?.makeKeyAndVisible()

    }
}
