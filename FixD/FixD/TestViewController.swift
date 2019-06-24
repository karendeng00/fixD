//
//  TestViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/21/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit


import Foundation

class TestViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IssuePasser().passData()

        // Do any additional setup after loading the view.
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


