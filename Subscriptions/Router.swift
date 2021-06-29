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
    
    private let navigationController: UINavigationController
    
    // MARK: - Initialize Router
    internal init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Start Routing
    
    func start() {
        let homeScreenView = HomeViewControllerView.instantiateStoryboard(.HomePage)
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: homeScreenView)
        UIApplication.shared.windows.first?.makeKeyAndVisible()

        
        
//        let onBoardingView = OnBoardingViewController.instantiateStoryboard(.OnBoarding)
//        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: onBoardingView)
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
