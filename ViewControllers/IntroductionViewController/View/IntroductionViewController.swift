//  
//  IntroductionViewController.swift
//  Subscriptions
//
//  Created by Parth Patel on 25/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var pageTitleLabel: UILabel!
    
    // VARIABLES HERE
    var viewModel = IntroductionViewControllerViewModel()
    var name: String?
    var titleText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pageTitleLabel.text = name
    }
    
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


