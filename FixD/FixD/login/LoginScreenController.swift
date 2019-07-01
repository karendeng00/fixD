//
//  ViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/5/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {

    var oAuthService: OAuthService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oAuthService = OAuthService.shared
    }

    @IBAction func loginButton(_ sender: UIButton) {
        oAuthService?.setClientName(oAuthClientName: "dukemobile")
        if oAuthService!.isAuthenticated() {
            print("Login - about to refresh tokens")
        }
    }
    
}
