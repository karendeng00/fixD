//
//  NEWNewIssueFMDPage2ViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/24/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NewIssueFMDPage2ViewController: UIViewController {

    @IBOutlet weak var buildingSecondDropDown: DropDown!
    @IBOutlet weak var floorSecondDropDown: DropDown!
    @IBOutlet weak var roomSecondDropDown: DropDown!
    @IBOutlet weak var serviceListDropDown: DropDown!
    @IBOutlet weak var fundCodeTextField: UITextField!
    
    var myIssue = IssueClass()
    
    var same:Bool = false
    var buildingText:String = ""
    var floorText:String = ""
    var roomText:String = ""
    
    let buildingList = ["a", "b"]
    let floorList = ["c", "d"]
    let roomList = ["e", "f"]
    var serviceList:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildingSecondDropDown.optionArray = buildingList
        floorSecondDropDown.optionArray = floorList
        roomSecondDropDown.optionArray = roomList
        serviceListDropDown.optionArray = serviceList
        
        buildingSecondDropDown.text = "Please select"
        floorSecondDropDown.text = "Please select"
        roomSecondDropDown.text = "Please select"
        serviceListDropDown.text = "Please select"
        
        if same {
            buildingSecondDropDown.text = buildingText
            floorSecondDropDown.text = floorText
            roomSecondDropDown.text = roomText
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if buildingSecondDropDown.text != "Please select" && floorSecondDropDown.text != "Please select" && roomSecondDropDown.text != "Please select" && serviceListDropDown.text != "Please select" {
            myIssue.defineEAMParamsP2(service_building: buildingSecondDropDown.text!, service_floor: floorSecondDropDown.text!, service_room: roomSecondDropDown.text!, service_type: serviceListDropDown.text!, fund_code: fundCodeTextField.text ?? "")
            myIssue.buildIssue()
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
