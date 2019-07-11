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
    var myUser:UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oAuthService = OAuthService.shared
        UserDefaults.standard.set(false, forKey: "LoggedIn")


        if(oAuthService!.isAuthenticated()) {
            oAuthService?.logout()
        }
        
        loadUserOrMakeNewOne()
    }
    
    
    private func loadUserOrMakeNewOne() {
        NetworkAPI().getUserByNetId(netid: "aam79") { user in
            self.myUser = user
            if self.myUser?.isNewUser() == true {
                print("new")
                self.myUser = NetworkAPI().newUser(name: "NAME2", netid: "NETID", phone: "PHONE", picture: "PICTURE")
            }
        }
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let nav = self.navigationController
        
        oAuthService?.setClientName(oAuthClientName: "dukeissuereporting")
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
