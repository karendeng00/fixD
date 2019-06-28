//
//  NEWNewIssueFMDViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/24/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NewIssueFMDViewController: UIViewController {
    
    
    var myIssue = IssueClass()
    
    var dex:Int = 0
    var locationOption:String = ""
    var cont:Bool = true
    
    @IBOutlet weak var firstBuildingDropDown: DropDown!
    @IBOutlet weak var firstFloorDropDown: DropDown!
    @IBOutlet weak var firstRoomDropDown: DropDown!
    @IBOutlet weak var requestDropDown: DropDown!
    @IBOutlet weak var sameDropDown: DropDown!
    
    let buildingList = ["Allen", "Broadhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    let requestList = ["Key & Lock", "University Interior Building", "Grounds/Exterior Building Request"]
    let sameList = ["yes", "no"]
    let serviceOptions = [["Keys/Locks/Doors"], ["Electrical", "Elevator", "Ice Machine"], ["Grounds/Landscaping", "Projects", "Sidewalks"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstBuildingDropDown.optionArray = buildingList
        firstFloorDropDown.optionArray = floorList
        firstRoomDropDown.optionArray = roomList
        requestDropDown.optionArray = requestList
        sameDropDown.optionArray = sameList
        
        firstBuildingDropDown.text = "Please select"
        firstFloorDropDown.text = "Please select"
        firstRoomDropDown.text = "Please select"
        requestDropDown.text = "Please select"
        sameDropDown.text = "Please select"
        
        requestDropDown.didSelect{(selectedText , index ,id) in
            self.dex = index
        }
            
        sameDropDown.didSelect{(selectedText, index, id) in
            self.locationOption = selectedText
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if firstBuildingDropDown.text != "Please select" && firstFloorDropDown.text != "Please select" && firstRoomDropDown.text != "Please select" && requestDropDown.text != "Please select" && sameDropDown.text != "Please select" {
            myIssue.defineEAMParamsP1(your_building: firstBuildingDropDown.text!, your_floor: firstFloorDropDown.text!, your_room: firstRoomDropDown.text!, request_for: requestDropDown.text!)
            return true
        }
        createAlert(title: "Selections Missing", message: "Please fill in missing selections.")
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FMDissue" {
            let viewController = segue.destination as? NewIssueFMDPage2ViewController
            if locationOption == "yes" {
                viewController?.same = true
                viewController?.buildingText = firstBuildingDropDown.text!
                viewController?.floorText = firstFloorDropDown.text!
                viewController?.roomText = firstRoomDropDown.text!
            }
            viewController?.serviceList = serviceOptions[dex]
            viewController?.myIssue = myIssue
        }
    }
    
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
