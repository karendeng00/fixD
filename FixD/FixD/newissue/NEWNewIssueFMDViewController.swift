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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstBuildingDropDown.optionArray = buildingList
        firstFloorDropDown.optionArray = floorList
        firstRoomDropDown.optionArray = roomList
        requestDropDown.optionArray = requestList
        sameDropDown.optionArray = sameList
        
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
