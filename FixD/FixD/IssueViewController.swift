//
//  IssueViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {

    @IBOutlet weak var issueTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let Issues = IssueAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cameraButton(_ sender: Any) {
    }
    
    @IBAction func mapButton(_ sender: Any) {
    }
    
    @IBAction func submitButton(_ sender: Any) {
        var issueToAppend = IssueClass(title: issueTextField.text!, description: descriptionTextField.text!, location: "Bostock", date: "June 6", issueImage: "printer.png", user: UserProfile(name:"Karen", image: "photo.jpg"))
        
        Issues.appendIssue(issue: issueToAppend)
    }
}
