//
//  TestController.swift
//  FixD
//
//  Created by Duc Tran on 7/1/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class TestController: UITabBarController {

    private var myIssues: [Int : IssueClass] = [:]
    var testNum = 1132123
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IssueLoader().getData { (issueData) in
            self.myIssues = issueData
        }
    }
    
}
