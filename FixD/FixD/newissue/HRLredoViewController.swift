//
//  HRLredoViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/26/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class HRLredoViewController: UIViewController {
    
    @IBOutlet weak var campusDropDown: DropDown!
    @IBOutlet weak var areaDropDown: DropDown!
    @IBOutlet weak var locationDropDown: DropDown!
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var serviceAnimalDropDown: DropDown!
    
    var myIssue:IssueClass = IssueClass()
    
    let campusList = ["East Campus", "West Campus"]
    let areaList = ["Crowell", "Craven", "Keohane", "Few", "Edens", "Kilgo", "Hollows", "Wannamaker"]
    let locationList = ["House A", "House B", "House C", "House D", "House E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campusDropDown.optionArray = campusList
        areaDropDown.optionArray = areaList
        locationDropDown.optionArray = locationList
        serviceAnimalDropDown.optionArray = ["yes", "no"]
        
        campusDropDown.text = "Please select"
        areaDropDown.text = "Please select"
        locationDropDown.text = "Please select"
        serviceAnimalDropDown.text = "Please select"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if campusDropDown.text != "Please select" && areaDropDown.text != "Please select" && locationDropDown.text != "Please select" && serviceAnimalDropDown.text != "Please select" {
            var ifAnimal = false
            if (serviceAnimalDropDown.text! == "yes") {
                ifAnimal = true
            }
            else { ifAnimal = false}
            myIssue.defineHRLParams(campus: campusDropDown.text!, area: areaDropDown.text!, specific_location: locationDropDown.text!, room: roomTextField.text!, animal: ifAnimal )
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
