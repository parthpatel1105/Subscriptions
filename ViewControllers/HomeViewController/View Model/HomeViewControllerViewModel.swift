//  
//  HomeViewControllerViewModel.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

class HomeViewControllerViewModel {

    /// Count your data in model
    var count: Int = 0

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
    //var selectedObject: HomeViewControllerModel?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init() {
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

extension HomeViewControllerViewModel {

}

// MARK: - Configure CollectionView

enum Section {
    case main
}

struct HeaderItem: Hashable {
    let title: String
    let image: UIImage
    let symbols: [SFSymbolItem]
}

struct SFSymbolItem: Hashable {
    
    let name: String
    let image: UIImage
    
    internal init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}

enum ListItem: Hashable {
    case header(HeaderItem)
    case symbol(SFSymbolItem)
}

