//  
//  OnBoardingViewControllerView.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIPageViewController {

    // OUTLETS HERE

    // VARIABLES HERE
    var viewModel = OnBoardingViewControllerViewModel()

    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Theme.primaryTextColor
        delegate = self
        dataSource = self
        
        
        UIPageControl.appearance(whenContainedInInstancesOf: [OnBoardingViewController.self]).currentPageIndicatorTintColor = Theme.currentPageTintColor
        UIPageControl.appearance(whenContainedInInstancesOf: [OnBoardingViewController.self]).pageIndicatorTintColor = Theme.pageTintColor

        setViewControllers([viewModel.createSlideViewController1(fromIndex: 0)], direction: .forward, animated: true)

    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.viewModel.fullOnboarding.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        var index: Int = 0
        for (location, scene) in self.viewModel.fullOnboarding.enumerated() {
            if let controller = pageViewController.children.first as? IntroductionViewController, controller.name == scene.pageTitle {
                index = location
            }
        }
        return index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let tag = pageViewController.viewControllers!.first!.view.tag - 1
        guard tag >= 0 else { return nil }
        return viewModel.createSlideViewController1(fromIndex: tag)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let tag = pageViewController.viewControllers!.first!.view.tag + 1
        guard tag < viewModel.fullOnboarding.count else { return nil }
        return viewModel.createSlideViewController1(fromIndex: tag)

    }
    

}

extension OnBoardingViewController {
    
    // MARK: - Setup View Model
    
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.viewModel.didGetData = {
            // update UI after get data
        }

    }
}


