//
//  ViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/5/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {
    
    @IBOutlet weak var usernameTextBox: UITextField!
    
    private var myUserAccount: FixDAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextBox.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(){
        view.endEditing(true)
    }
    
    func createAccount(name: String) {
        myUserAccount = FixDAccount(name: name)
    }
    
    @IBAction func submit(_ sender: UIButton) {
        view.endEditing(true)
        performSegue(withIdentifier: "LoginButton", sender: sender)
    }
}

extension LoginScreenController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
