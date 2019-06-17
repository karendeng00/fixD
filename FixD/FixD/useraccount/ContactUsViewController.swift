//
//  ContactUsViewController.swift
//  FixD
//
//  Created by Duc Tran on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func makeCall(_ sender: UIButton) {
        let phoneNum = sender.titleLabel?.text
        if let url = URL(string: "tel://\(phoneNum)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
