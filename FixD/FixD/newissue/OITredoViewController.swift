//
//  OITredoViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/26/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class OITredoViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var urgencyDropDown: DropDown!
    @IBOutlet weak var impactDropDown: DropDown!
    @IBOutlet weak var sensitiveInfo: UITextView!
    @IBOutlet weak var attachementPic: UIImageView!
    
    var myIssue:IssueClass = IssueClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urgencyDropDown.optionArray = ["Low", "Medium", "High"]
        impactDropDown.optionArray = ["Individual", "Work Group", "Widespread"]
        
        urgencyDropDown.text = "Please select"
        impactDropDown.text = "Please select"
        
        sensitiveInfo.text = "Enter any PHI or other sensitive information in this field."
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if urgencyDropDown.text != "Please select" && impactDropDown.text != "Please select" {
            myIssue.defineServiceNowParams(urgency: urgencyDropDown.text!, impact: impactDropDown.text!, sensitive_info: sensitiveInfo.text!)
            myIssue.buildSNIssue()
            print(myIssue.getTitle())
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        sensitiveInfo.text = ""
    }

}
