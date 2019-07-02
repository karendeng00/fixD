//
//  NewIssuePTSViewController.swift
//  FixD
//
//  Created by Ann Bailey on 7/1/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NewIssuePTSViewController: UIViewController {

    @IBOutlet weak var topicDropDown: DropDown!
    
    let topicList = ["Transit", "Parking", "Enforcement", "Special Events", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicDropDown.optionArray = topicList
        
        topicDropDown.text = "Please select"
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if topicDropDown.text != "Please select" {
            return true
        }
        createAlert(title: "Selections Missing", message: "Please fill in missing selections.")
        return false
    }
    
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}