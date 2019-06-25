//
//  NewIssueHRLViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/13/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NewIssueHRLViewController: UIViewController { //, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var campusDropDown: DropDown!
    @IBOutlet weak var areaDropDown: DropDown!
    @IBOutlet weak var locationDropDown: DropDown!
    @IBOutlet weak var serviceAnimalDropDown: DropDown!
    
    //private var locationPickerData: [String] = Array()
    
    //private var dict: Dictionary <String, Dictionary<String,Array<String>>> = Dictionary()
    
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let campusList = ["East Campus", "West Campus"]
    let areaList = ["Crowell", "Craven", "Keohane", "Few", "Edens", "Kilgo", "Hollows", "Wannamaker"]
    let locationList = ["House A", "House B", "House C", "House D", "House E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campusDropDown.optionArray = campusList
        areaDropDown.optionArray = areaList
        locationDropDown.optionArray = locationList
        serviceAnimalDropDown.optionArray = ["yes", "no"]
     
//        setUpPickers()
//        campusPickerData = ["East Campus", "West Campus"]
//        areaPickerData = ["Crowell", "Craven", "Keohane", "Few", "Edens", "Kilgo", "Hollows", "Wannamaker"]
//        locationPickerData = ["House A", "House B", "House C", "House D", "House E"]
//
    }
    
//    private func setUpPickers() {
//        self.campusPicker.delegate = self
//        self.campusPicker.dataSource = self
//        self.areaPicker.delegate = self
//        self.areaPicker.dataSource = self
//        self.locationPicker.delegate = self
//        self.locationPicker.dataSource = self
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Campus Picker
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if (pickerView == campusPicker) {
//            return campusPickerData.count
//        }
//        else if (pickerView == areaPicker) {
//            return areaPickerData.count
//        }
//        else {
//            return locationPickerData.count
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if (pickerView == campusPicker) {
//            return campusPickerData[row]
//        }
//        else if (pickerView == areaPicker) {
//            return areaPickerData[row]
//        }
//        else {
//            return locationPickerData[row]
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
