//
//  LoadScreenViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 7/22/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//This class serves as a login authenticator. If the user is logged in, the app opens up. Else, the login screen opens up.
class LoadScreenViewController: UIViewController {

    var oAuthService: OAuthService?
    
    //If the user is authenticated, the feeedview controller shows up. Else, the user is prompted to login through OAuth and Shib.
    override func viewDidLoad() {
        super.viewDidLoad()
        oAuthService = OAuthService.shared
        if oAuthService!.isAuthenticated() {
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            DispatchQueue.main.async {
                let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                self.present(tabVC!, animated: true, completion: nil)
            }
        }
        else {
            DispatchQueue.main.async {
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginNav") as? UINavigationController
                self.present(loginVC!, animated: true, completion: nil)
            }
        }

    }
}
