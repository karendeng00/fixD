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
        issueDescriptionText.text = "Type your description here."
        createAlert(title: "Is this an emergency?", message: "If this is an emergency, please call 911 or contact Duke Police.")
        
        //Heights needed to adjust the screen for when the keyboard appears
        tabBarHeight = tabBarController?.tabBar.bounds.size.height ?? 0
        navBarHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        listenForNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
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
    
    //Methods to listen for when the keyboard is called
    func listenForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification  || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            //When the keyboard appears, this is the value that the screens needs to be shifted up by.
            view.frame.origin.y = -(keyboardRect.height - tabBarHeight - navBarHeight - statusBarHeight)
        }else {
            //When the keyboard is dismissed, the height needs to be reset to this value.
            view.frame.origin.y = navBarHeight + statusBarHeight
        }
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
