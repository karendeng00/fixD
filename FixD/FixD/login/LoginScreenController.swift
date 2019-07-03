//
//  ViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/5/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {

    //var oAuthService: OAuthService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //oAuthService = OAuthService.shared
    }

    @IBAction func loginButton(_ sender: UIButton) {
//        oAuthService?.setClientName(oAuthClientName: "wearduke")
//        if oAuthService!.isAuthenticated() {
//            print("Login - about to refresh tokens")
//            oAuthService?.refreshToken(navController: self.navigationController!) {
//                success, statusCode in
//
//                //TODO: Handle errors?
//
//                if success {
//                    UserDefaults.standard.set(true, forKey: "LoggedIn") //TEMP
//                    self.navigationController?.dismiss(animated:true, completion: nil)
//                } else {
//                    self.performSegue(withIdentifier: "loginFailed", sender: sender)
//                }
//            }
//        }
//        else if let navController = navigationController {
//            print("Login - about to authenticate")
//            oAuthService?.authenticate(navController: navController) { success in
//                if success {
//                    print("Login - success")
//                    UserDefaults.standard.set(true, forKey: "LoggedIn") //Temp
//                    self.navigationController?.dismiss(animated:true, completion: nil)
//                } else {
//                    print("Login - failed")
//                    self.performSegue(withIdentifier: "loginFailed", sender: sender)
//                }
//
//            }
//        }
    }
    
}
