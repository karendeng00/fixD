//
//  NEWNewIssueFMDViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/24/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NEWNewIssueFMDViewController: UIViewController {
    
    var dex:Int = 0
    var locationOption:String = ""

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
        
        print("view loaded")
        firstBuildingDropDown.optionArray = buildingList
        firstFloorDropDown.optionArray = floorList
        firstRoomDropDown.optionArray = roomList
        requestDropDown.optionArray = requestList
        sameDropDown.optionArray = sameList
        
        requestDropDown.didSelect{(selectedText , index ,id) in
            self.dex = index
        }
            
        sameDropDown.didSelect{(selectedText, index, id) in
            self.locationOption = selectedText
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FMDissue" {
            let viewController = segue.destination as? NEWNewIssueFMDPage2ViewController
            
            if locationOption == "yes" {
                viewController?.option = true
                viewController?.buildingText = firstBuildingDropDown.text!
            }
            
            viewController?.serviceList = serviceOptions[dex]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
