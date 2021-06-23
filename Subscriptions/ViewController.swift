//
//  ViewController.swift
//  Subscriptions
//
//  Created by Parth Patel on 08/09/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    private let config: NSScreencastConfiguration
    
//    init(config: NSScreencastConfiguration) {
//        self.config = config
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let config = EnvironmentConfiguration()
        print("Base API URL = \(config.baseApiUrl)")
        
        self.view.backgroundColor = Theme.primaryTextColor//UIColor.backgroundColor
        self.label.textColor = Theme.labelTextColor
        self.label.font = UIFont.titleExtraLarge
        self.label.backgroundColor = .red
        self.textView.textContainerInset = UIEdgeInsets.tightMargin
        self.textView.backgroundColor = .yellow
    }
}

