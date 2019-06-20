//
//  TestFMDViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/20/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class TestFMDViewController: UIViewController {
    
    @IBOutlet weak var buildingDD: DropDown!
    @IBOutlet weak var floorDD: DropDown!
    @IBOutlet weak var roomDD: DropDown!
    
    let buildingList = ["Allen", "Broadhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildingDD.optionArray = buildingList
        floorDD.optionArray = floorList
        roomDD.optionArray = roomList
    }
    
    
    
    

}
