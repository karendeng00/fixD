//
//  testViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class testViewController: UIViewController {


    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("okay")
        // Do any additional setup after loading the view.
        
        //posts a notification
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: self)
        
        
        
        
    }
    
    @objc func toggleSideMenu(/*_ notification: Notification*/) {
        if sideMenuConstraint != nil {
            if sideMenuOpen {
                sideMenuOpen = false
                sideMenuConstraint.constant = -240
            }
            else {
                sideMenuOpen = true
                sideMenuConstraint.constant = 0
                
            }
        }
        
    }
    
    
    
    
}

