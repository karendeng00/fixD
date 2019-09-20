//
//  MainTabViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 7/3/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//The main purpose of this class was to prevent the first nav. controller in the storyboard from appearing which made the tab bar look weird.
class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    //Code to remove a navigation controller view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //Code to remove a navigation controller view
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
