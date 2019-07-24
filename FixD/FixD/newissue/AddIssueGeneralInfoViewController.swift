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
    @IBOutlet weak var issueReportScrollView: UIScrollView!
    
    private var tabBarHeight:CGFloat = 0
    private var navBarHeight:CGFloat = 0
    private var statusBarHeight:CGFloat = 0
    
    fileprivate func setUpTapGesture() {
        nameText.delegate = self
        emailText.delegate = self
        phoneText.delegate = self
        altPhoneText.delegate = self
        issueTitleText.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddIssueGeneralInfoViewController.handleTapOutside))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTapGesture()
        //issueDescriptionText.text = "Type your description here."
        createAlert(title: "Is this an emergency?", message: "If this is an emergency, please call 911 or contact Duke Police.")
        
        //Heights needed to adjust the screen for when the keyboard appears
        tabBarHeight = tabBarController?.tabBar.bounds.size.height ?? 0
        navBarHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        nameText.text = "Ann Bailey"
        emailText.text = "email@duke.edu"
        phoneText.text = "999-999-9999"
        issueTitleText.text = "Computer broken"
        issueDescriptionText.text = "One of the computers in the Link Classroom 5 has a broken screen. It is located in the third row from the front on the far right side of the room when you enter."
        
    }
    
    @objc func handleTapOutside(){
        view.endEditing(true)
        issueDescriptionText.text = "Type your description here."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IssueToSecondPage" {
            let viewController = segue.destination as? NewIssueFromCategoryViewController
            
            viewController?.myIssue = IssueClass(name: nameText.text!, email: emailText.text!, phone: phoneText.text!, altPhone: altPhoneText.text!, title: issueTitleText.text!, description: issueDescriptionText.text!)
        }
    }

   func createAlert(title:String, message:String) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
           alert.dismiss(animated: true, completion: nil)
       }))
       self.present(alert, animated: true, completion: nil)
   }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameText.text != "" &&
            nameText.text != "" && emailText.text != "" && phoneText.text != "" && emailText.text != "" && phoneText.text != "" && issueTitleText.text != "" && issueDescriptionText.text != "Type Your Description Here" && issueDescriptionText.text != "" {
            return true
        }
        createAlert(title: "Selections Missing", message: "Please fill in missing selections.")
        return false
    }
}

extension AddIssueGeneralInfoViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        issueDescriptionText.text = ""
    }
    
}
