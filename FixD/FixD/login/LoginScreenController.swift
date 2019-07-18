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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oAuthService = OAuthService.shared
        if oAuthService!.isAuthenticated() {
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            print ("Token Refreshed - success")
            DispatchQueue.main.async {
                let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                self.present(tabVC!, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let nav = self.navigationController
        
        oAuthService?.setClientName(oAuthClientName: "dukeissuereporting")
        if oAuthService!.isAuthenticated() {
            oAuthService?.refreshToken(navController: nav!) { success, statusCode in
                if success {
                    UserDefaults.standard.set(true, forKey: "LoggedIn")
                    print ("Token Refreshed - success")
                    DispatchQueue.main.async {
                        let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                        self.present(tabVC!, animated: true, completion: nil)
                    }
                }
            }
        }
        else if let navController = navigationController {
            oAuthService?.authenticate(navController: navController) {success in
                if success {
                    print ("Login - success")
                    UserDefaults.standard.set(true, forKey: "LoggedIn")
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
