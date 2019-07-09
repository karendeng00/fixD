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
        //oAuthService?.logout()
        //print("yay")
        let nav = self.navigationController
        
        oAuthService?.setClientName(oAuthClientName: "wearduke")
        if oAuthService!.isAuthenticated() {
            print ("Login")
            oAuthService?.refreshToken(navController: nav!) { success, statusCode in
                if success {
                    UserDefaults.standard.set(true, forKey: "LoggedIn")
                    print ("SUCCESS")
                    DispatchQueue.main.async {
                        let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                        self.present(tabVC!, animated: true, completion: nil)
                    }
                }
            }
        }
        else if let navController = navigationController {
            print ("Log in")
            oAuthService?.authenticate(navController: navController) {success in
                if success {
                    print ("LOGIN SUCCESS")
                    //self.navigationController?.dismiss(animated:true, completion: nil)
                    //self.navigationController?.dismiss(animated: true, completion: nil)
                    //self.performSegue(withIdentifier: "showMainFeed", sender: sender)
                    DispatchQueue.main.async {
                        let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                        self.present(tabVC!, animated: false, completion: nil)
                    }
                    
                } else {
                    print ("LOGIN FAILED")
                }
            }
            
        }
        
        

    }
    
}
