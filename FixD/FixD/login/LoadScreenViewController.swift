//
//  LoadScreenViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 7/22/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class LoadScreenViewController: UIViewController {

    var oAuthService: OAuthService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oAuthService = OAuthService.shared
        if oAuthService!.isAuthenticated() {
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            DispatchQueue.main.async {
                let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "tab") as? UITabBarController
                self.present(tabVC!, animated: true, completion: nil)
                //                NetworkAPI().getUserDuid(nav: nav!) { duid,error in }
            }
        }
        else {
            DispatchQueue.main.async {
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginNav") as? UINavigationController
                self.present(loginVC!, animated: true, completion: nil)
            }
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
