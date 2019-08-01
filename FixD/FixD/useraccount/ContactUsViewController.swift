//
//  ContactUsViewController.swift
//  FixD
//
//  Created by Duc Tran on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//View Controller that corresponds to the Contact Us screen.
class ContactUsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Code to allow app to call number
    @IBAction func makeCall(_ sender: UIButton) {
        if let phoneNum = sender.titleLabel?.text {
            if let url = URL(string: "tel://\(String(describing: phoneNum))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }else{
            print("Failed")
        }
    }
    
}
