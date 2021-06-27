//  
//  OnBoardingViewControllerViewModel.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

enum OnboardingPage: Int, CaseIterable {
    case welcome = 0
    case newFeature
    case permissions
    case sales
    
    
    
    var shouldShowNextButton: Bool {
        switch self {
        case .welcome, .newFeature, .permissions:
            return true
        default:
            return false
        }
    }
    
    var pageTitle: String {
        switch self {
        case .welcome:
            return "Hey there! Welcome to our App"
        case .newFeature:
            return "Please bear with us for onborading"
        case .permissions:
            return "Please allow Push notification permission"
        case .sales:
            return "Let's make a sale"
        }
    }

}

class OnBoardingViewControllerViewModel {

    /// Count your data in model
    var count: Int = 0
    let fullOnboarding = OnboardingPage.allCases
    var currentPageIndex = 0
    
    //MARK: -- Network checking


    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model
    //var selectedObject: OnBoardingViewControllerModel?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init() {
    }
    
    // MARK: - Create a View Controller
    
    func getViewController(forViewController controller: UIViewController, isNextController: Bool) -> UIViewController? {
        guard let controller = controller as? IntroductionViewController else { return nil }
        var index: Int = 0
        for (location, scene) in fullOnboarding.enumerated() {
            if scene.pageTitle == controller.name {
                index = location
            }
        }
        isNextController ? (index += 1) : (index -= 1)
        if isNextController {
            if fullOnboarding.count > index {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }else{
            if index >= 0 {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }
    }

    
    func createSlideViewController(fromIndex index: Int) -> UIViewController {
        let screen = fullOnboarding[currentPageIndex]
        let introductionView = IntroductionViewController.instantiateStoryboard(.OnBoarding)
        introductionView.name = screen.pageTitle
        introductionView.view.tag = screen.rawValue
        return introductionView
    }

    
    func createSlideViewController1(fromIndex index: Int) -> UIViewController {
        //let currentPage = OnboardingPage(rawValue: index)
        
        let screen = fullOnboarding[index]
        let introductionView = IntroductionViewController.instantiateStoryboard(.OnBoarding)
        introductionView.view.tag = screen.rawValue
        introductionView.name = screen.pageTitle
        return introductionView
        
//        switch currentPage {
//        case .welcome:
//        case .newFeature:
//        case .permissions:
//        case .sales:
//        }
        
        
    }



    //MARK: -- Example Func
    /*
    func exampleBind() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            // call your service here
            self.service.removeThisFuncName(success: { data in
                
                self.isLoading = false
                // self.model = data
                self.didGetData?()
                
            }) { errorMsg, errorCode in
                if errorCode == 0 {
                    self.serverErrorStatus?()
                } else {
                    self.isLoading = false
                    self.alertMessage = errorMsg
                }
            }
        default:
            break
        }
    }
    */

}

extension OnBoardingViewControllerViewModel {

}
