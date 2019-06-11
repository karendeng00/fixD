//
//  SideMenuViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showSideMenu), name: NSNotification.Name(rawValue: "ShowSideMenu"), object: nil)

    }
    
    @objc func showSideMenu() {
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
            print("yeP")
        }
        else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
            print("Nope")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
