//  
//  HomeViewControllerView.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import UIKit

class HomeViewControllerView: UIViewController {

    // OUTLETS HERE

    @IBOutlet weak var moreButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    // VARIABLES HERE
    var viewModel = HomeViewControllerViewModel()

    
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
        self.title = "Subscription"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}

extension HomeViewControllerView {
    
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


