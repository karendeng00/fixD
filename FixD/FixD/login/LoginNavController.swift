//
//  LoginNavController.swift
//  FixD
//
//  Created by Duc Tran on 7/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class LoginNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }

}
