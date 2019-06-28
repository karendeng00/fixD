//
//  AddIssueGeneralInfoViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AddIssueGeneralInfoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var altPhoneText: UITextField!
    @IBOutlet weak var issueTitleText: UITextField!
    @IBOutlet weak var issueDescriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueDescriptionText.text = "Type your description here."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IssueToSecondPage" {
            let viewController = segue.destination as? NewIssueFromCategoryTableViewController
            
            viewController?.myIssue = IssueClass(name: nameText.text!, email: emailText.text!, phone: phoneText.text!, altPhone: altPhoneText.text!, title: issueTitleText.text!, description: issueDescriptionText.text!)
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameText.text != "" &&
            nameText.text != "" && emailText.text != "" && phoneText.text != "" && emailText.text != "" && phoneText.text != "" && issueTitleText.text != "" && issueDescriptionText.text != "Type Your Description Here" {
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
            issueDescriptionText.text = ""
    }
    
}
