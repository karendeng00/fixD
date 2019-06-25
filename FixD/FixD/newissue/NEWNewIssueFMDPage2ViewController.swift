//
//  NEWNewIssueFMDPage2ViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/24/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NEWNewIssueFMDPage2ViewController: UIViewController {

    @IBOutlet weak var buildingSecondDropDown: DropDown!
    @IBOutlet weak var floorSecondDropDown: DropDown!
    @IBOutlet weak var roomSecondDropDown: DropDown!
    @IBOutlet weak var serviceListDropDown: DropDown!
    @IBOutlet weak var fundCodeTextField: UITextField!
    
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
        
        if same {
            print("yes")
            buildingSecondDropDown.text = buildingText
            floorSecondDropDown.text = floorText
            roomSecondDropDown.text = roomText
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
