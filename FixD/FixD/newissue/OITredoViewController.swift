//
//  OITredoViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/26/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class OITredoViewController: UIViewController {
    
    
    @IBOutlet weak var urgencyDropDown: DropDown!
    @IBOutlet weak var impactDropDown: DropDown!
    @IBOutlet weak var senstiveInfo: UITextView!
    @IBOutlet weak var attachementPic: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        urgencyDropDown.optionArray = ["Low", "Medium", "High"]
        impactDropDown.optionArray = ["Individual", "Work Group", "Widespread"]
        
        urgencyDropDown.text = "Please select"
        impactDropDown.text = "Please select"
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if urgencyDropDown.text != "Please select" && impactDropDown.text != "Please select" {
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
