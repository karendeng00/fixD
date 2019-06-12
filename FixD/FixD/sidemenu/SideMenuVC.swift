//
//  SideMenuVC.swift
//  FixD
//
//  Created by Karen Deng on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var sideMenu: UIView!
    
    @IBOutlet weak var mainScreen: UIView!
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu.bounds.size.width = self.view.bounds.width * 0.8
        sideMenu.bounds.size.height = self.view.bounds.height
        mainScreen.bounds.size.width = self.view.bounds.width
        mainScreen.bounds.size.width = self.view.bounds.height
        // Do any additional setup after loading the view.
    }
    
    /*@objc func toggleSideMenu() {
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -self.view.bounds.width * 0.8
            
        } else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
