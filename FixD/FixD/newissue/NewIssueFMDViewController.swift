//
//  NewIssueOITViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/13/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class NewIssueFMDViewController: UIViewController {
    
    @IBOutlet weak var buildingDD1: DropDown!
    @IBOutlet weak var floorDD1: DropDown!
    @IBOutlet weak var roomDD1: DropDown!
    @IBOutlet weak var serviceLocationSelector: DropDown!
    @IBOutlet weak var buildingDD2: DropDown!
    @IBOutlet weak var floorDD2: DropDown!
    @IBOutlet weak var roomDD2: DropDown!
    @IBOutlet weak var requestSelector: DropDown!
    @IBOutlet weak var serviceTypeSelector: DropDown!
    @IBOutlet weak var fundCode: UITextField!
    @IBOutlet weak var emailSelector: DropDown!
    
//    @IBOutlet weak var buildingSB: UISearchBar!
//    @IBOutlet weak var buildingSelect: UILabel!
//    @IBOutlet weak var buildingTV: UITableView!
//    @IBOutlet weak var floorSB: UISearchBar!
//    @IBOutlet weak var floorSelect: UILabel!
//    @IBOutlet weak var floorTV: UITableView!
//    @IBOutlet weak var roomSB: UISearchBar!
//    @IBOutlet weak var roomSelect: UILabel!
//    @IBOutlet weak var roomTV: UITableView!
    
    
    let buildingList = ["Allen", "Brodhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    let requestList = ["Key & Lock", "University Interior Building", "Grounds/Exterior Building Request", "Student Housing", "Event Support", "Roads", "Sanitation/Recycling"]
    let keyLockList = ["Keys/Locks/Doors"]
    let interiorBuildingList = [String]()
    let exteriorBuildingList = ["Grounds/Landscaping", "Projects", "Sidewalks", "Site Lighting", "Site Utilities"]
    let studentHousingList = [String]()
    let eventSupportList = ["Event Support"]
    let roadsList = ["Roads"]
    let sanitationList = ["Sanitation/Recycling"]
    
//    var searchBuilding = [String]()
//    var searchingBuilding = false
//    var buildingTextDidChange = false
//    var buildingChosen = false
//    var searchFloor = [String]()
//    var searchingFloor = false
//    var floorTextDidChange = false
//    var floorChosen = false
//    var searchRoom = [String]()
//    var searchingRoom = false
//    var roomTextDidChange = false
//    var roomChosen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildingDD1.optionArray = buildingList
        floorDD1.optionArray = floorList
        roomDD1.optionArray = roomList
        serviceLocationSelector.optionArray = ["Yes", "No"]
        buildingDD2.optionArray = buildingList
        floorDD2.optionArray = floorList
        roomDD2.optionArray = roomList
        requestSelector.optionArray = requestList
        emailSelector.optionArray = ["Yes", "No"]
        
//        if requestSelector?.selectedIndex == 0 {
//            serviceTypeSelector.optionArray = keyLockList
//        }
        
        
//        buildingTV.isHidden = true
//        floorTV.isHidden = true
//        roomTV.isHidden = true
    }
    
    
    
//    func buildingAnimate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.3) {
//                self.buildingTV.isHidden = false
//                }
//        }
//        else {
//            UIView.animate(withDuration: 0.3) {
//                self.buildingTV.isHidden = true
//                }
//            }
//        }
//
//    func floorAnimate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.3) {
//                self.floorTV.isHidden = false
//            }
//        }
//        else {
//            UIView.animate(withDuration: 0.3) {
//                self.floorTV.isHidden = true
//            }
//        }
//    }
//
//    func roomAnimate(toggle: Bool) {
//        if toggle {
//            UIView.animate(withDuration: 0.3) {
//                self.roomTV.isHidden = false
//            }
//        }
//        else {
//            UIView.animate(withDuration: 0.3) {
//                self.roomTV.isHidden = true
//            }
//        }
//    }
//}
//
//extension NewIssueFMDViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == buildingTV {
//            if searchingBuilding {
//                return searchBuilding.count
//            }
//            else {
//                return buildingList.count
//            }
//        }
//        else if tableView == floorTV {
//            if searchingFloor{
//                return searchFloor.count
//            }
//            else {
//                return floorList.count
//            }
//        }
//        else if tableView == roomTV {
//            if searchingRoom {
//                return searchRoom.count
//            }
//            else {
//                return roomList.count
//            }
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var returnCell = UITableViewCell()
//        if tableView == buildingTV {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath)
//            if searchingBuilding {
//                cell.textLabel?.text = searchBuilding[indexPath.row]
//            }
//            else {
//                cell.textLabel?.text = buildingList[indexPath.row]
//            }
//            returnCell = cell
//        }
//        else if tableView == floorTV {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
//            if searchingFloor {
//                cell.textLabel?.text = searchFloor[indexPath.row]
//            }
//            else {
//                cell.textLabel?.text = floorList[indexPath.row]
//            }
//            returnCell = cell
//        }
//        else if tableView == roomTV {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
//            if searchingRoom {
//                cell.textLabel?.text = searchRoom[indexPath.row]
//            }
//            else {
//                cell.textLabel?.text = roomList[indexPath.row]
//            }
//            returnCell = cell
//        }
//        return returnCell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView == buildingTV {
//            if buildingTextDidChange {
//                self.buildingSelect.text = String("\(searchBuilding[indexPath.row])")
//            }
//            else {
//                self.buildingSelect.text = String("\(buildingList[indexPath.row])")
//            }
//            buildingAnimate(toggle: false)
//            buildingSB.showsCancelButton = true
//            buildingChosen = true
//            searchingBuilding = false
//        }
//        if tableView == floorTV {
//            if floorTextDidChange {
//                self.floorSelect.text = String("\(searchFloor[indexPath.row])")
//            }
//            else {
//                self.floorSelect.text = String("\(floorList[indexPath.row])")
//            }
//            floorAnimate(toggle: false)
//            floorSB.showsCancelButton = true
//            floorChosen = true
//            searchingFloor = false
//        }
//        if tableView == roomTV {
//            if roomTextDidChange {
//                self.roomSelect.text = ("\(searchRoom[indexPath.row])")
//            }
//            else {
//                self.roomSelect.text = ("\(roomList[indexPath.row])")
//            }
//            roomAnimate(toggle: false)
//            roomSB.showsCancelButton = true
//            roomChosen = true
//            searchingRoom = false
//        }
//    }
//}
//
//extension NewIssueFMDViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        if searchBar == buildingSB {
//            buildingAnimate(toggle: true)
//            searchBuilding = buildingList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
//            searchingBuilding = true
//            buildingTextDidChange = true
//            buildingTV.reloadData()
//        }
//        else if searchBar == floorSB {
//            floorAnimate(toggle: true)
//            searchFloor = floorList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
//            searchingFloor = true
//            floorTextDidChange = true
//            floorTV.reloadData()
//        }
//        else if searchBar == roomSB {
//            roomAnimate(toggle: true)
//            searchRoom = roomList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
//            searchingRoom = true
//            roomTextDidChange = true
//            roomTV.reloadData()
//        }
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        if searchBar == buildingSB {
//            buildingSB.showsCancelButton = true
//            buildingAnimate(toggle: true)
//        }
//        if searchBar == floorSB {
//            floorSB.showsCancelButton = true
//            floorAnimate(toggle: true)
//        }
//        if searchBar == roomSB {
//            roomSB.showsCancelButton = true
//            roomAnimate(toggle: true)
//        }
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        if searchBar == buildingSB {
//            buildingSB.text = ""
//            buildingSB.showsCancelButton = false
//            if buildingChosen {
//                buildingSelect.text = ""
//                buildingTV.reloadData()
//                buildingAnimate(toggle: true)
//            }
//        }
//        if searchBar == floorSB {
//            floorSB.text = ""
//            floorSB.showsCancelButton = false
//            if floorChosen {
//                floorSelect.text = ""
//                floorTV.reloadData()
//                floorAnimate(toggle: true)
//            }
//        }
//        if searchBar == roomSB {
//            roomSB.text = ""
//            roomSB.showsCancelButton = false
//            if roomChosen {
//                roomSelect.text = ""
//                roomTV.reloadData()
//                roomAnimate(toggle: true)
//            }
//        }
//    }
}
