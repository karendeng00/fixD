//
//  NewIssueOITViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/13/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueFMDViewController: UIViewController {
    
    @IBOutlet weak var buildingSB: UISearchBar!
    @IBOutlet weak var buildingSelect: UILabel!
    @IBOutlet weak var buildingTV: UITableView!
    @IBOutlet weak var buildingCancel: UIButton!
    @IBOutlet weak var floorSB: UISearchBar!
    @IBOutlet weak var floorSelect: UILabel!
    @IBOutlet weak var floorTV: UITableView!
    @IBOutlet weak var floorCancel: UIButton!
    @IBOutlet weak var roomSB: UISearchBar!
    @IBOutlet weak var roomSelect: UILabel!
    @IBOutlet weak var roomTV: UITableView!
    @IBOutlet weak var roomCancel: UIButton!
    
    
    let buildingList = ["Allen", "Brodhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    
    var searchBuilding = [String]()
    var searchingBuilding = false
    var buildingTextDidChange = false
    var buildingChosen = false
    var searchFloor = [String]()
    var searchingFloor = false
    var floorTextDidChange = false
    var floorChosen = false
    var searchRoom = [String]()
    var searchingRoom = false
    var roomTextDidChange = false
    var roomChosen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildingTV.isHidden = true
        floorTV.isHidden = true
        roomTV.isHidden = true
    }
    
    func buildingAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.buildingTV.isHidden = false
                }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.buildingTV.isHidden = true
                }
            }
        }
    
    func floorAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.floorTV.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.floorTV.isHidden = true
            }
        }
    }
    
    func roomAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.roomTV.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.roomTV.isHidden = true
            }
        }
    }
    
    
//    @IBAction func buildingCancel(_ sender: Any) {
//        if buildingChosen {
//            buildingSelect.text = ""
//            buildingTV.reloadData()
//            buildingAnimate(toggle: true)
//            buildingChosen = false
//        }
//        else {
//            buildingAnimate(toggle: false)
//        }
//    }
//
//    @IBAction func floorCancel(_ sender: Any) {
//        if floorChosen {
//            floorSelect.text = ""
//            floorTV.reloadData()
//            floorAnimate(toggle: true)
//            floorChosen = false
//        }
//        else {
//            floorAnimate(toggle: false)
//        }
//    }
//
//    @IBAction func roomCancel(_ sender: Any) {
//        if roomChosen {
//            roomSelect.text = ""
//            roomTV.reloadData()
//            roomAnimate(toggle: true)
//            roomChosen = false
//        }
//        else {
//            roomAnimate(toggle: false)
//        }
//    }
}

extension NewIssueFMDViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == buildingTV {
            if searchingBuilding {
                return searchBuilding.count
            }
            else {
                return buildingList.count
            }
        }
        else if tableView == floorTV {
            if searchingFloor{
                return searchFloor.count
            }
            else {
                return floorList.count
            }
        }
        else if tableView == roomTV {
            if searchingRoom {
                return searchRoom.count
            }
            else {
                return roomList.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == buildingTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath)
            if searchingBuilding {
                cell.textLabel?.text = searchBuilding[indexPath.row]
            }
            else {
                cell.textLabel?.text = buildingList[indexPath.row]
            }
            returnCell = cell
        }
        else if tableView == floorTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
            if searchingFloor {
                cell.textLabel?.text = searchFloor[indexPath.row]
            }
            else {
                cell.textLabel?.text = floorList[indexPath.row]
            }
            returnCell = cell
        }
        else if tableView == roomTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
            if searchingRoom {
                cell.textLabel?.text = searchRoom[indexPath.row]
            }
            else {
                cell.textLabel?.text = roomList[indexPath.row]
            }
            returnCell = cell
        }
        return returnCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == buildingTV {
            if buildingTextDidChange {
                self.buildingSelect.text = String("\(searchBuilding[indexPath.row])")
            }
            else {
                self.buildingSelect.text = String("\(buildingList[indexPath.row])")
            }
            buildingAnimate(toggle: false)
            buildingSB.showsCancelButton = true
            buildingChosen = true
            searchingBuilding = false
        }
        if tableView == floorTV {
            if floorTextDidChange {
                self.floorSelect.text = String("\(searchFloor[indexPath.row])")
            }
            else {
                self.floorSelect.text = String("\(floorList[indexPath.row])")
            }
            floorAnimate(toggle: false)
            floorSB.showsCancelButton = true
            floorChosen = true
            searchingFloor = false
        }
        if tableView == roomTV {
            if roomTextDidChange {
                self.roomSelect.text = ("\(searchRoom[indexPath.row])")
            }
            else {
                self.roomSelect.text = ("\(roomList[indexPath.row])")
            }
            roomAnimate(toggle: false)
            roomSB.showsCancelButton = true
            roomChosen = true
            searchingRoom = false
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == buildingSB {
            buildingSB.text = ""
            buildingSB.showsCancelButton = false
            if buildingChosen {
                buildingSelect.text = ""
                buildingTV.reloadData()
                buildingAnimate(toggle: true)
            }
        }
        if searchBar == floorSB {
            floorSB.text = ""
            floorSB.showsCancelButton = false
            if floorChosen {
                floorSelect.text = ""
                floorTV.reloadData()
                floorAnimate(toggle: true)
            }
        }
        if searchBar == roomSB {
            roomSB.text = ""
            roomSB.showsCancelButton = false
            if roomChosen {
                roomSelect.text = ""
                roomTV.reloadData()
                roomAnimate(toggle: true)
            }
        }
    }
}

extension NewIssueFMDViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar == buildingSB {
            buildingAnimate(toggle: true)
            searchBuilding = buildingList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingBuilding = true
            buildingTextDidChange = true
            buildingTV.reloadData()
        }
        else if searchBar == floorSB {
            floorAnimate(toggle: true)
            searchFloor = floorList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingFloor = true
            floorTextDidChange = true
            floorTV.reloadData()
        }
        else if searchBar == roomSB {
            roomAnimate(toggle: true)
            searchRoom = roomList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingRoom = true
            roomTextDidChange = true
            roomTV.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == buildingSB {
            buildingSB.showsCancelButton = true
            buildingAnimate(toggle: true)
        }
        if searchBar == floorSB {
            floorSB.showsCancelButton = true
            floorAnimate(toggle: true)
        }
        if searchBar == roomSB {
            roomSB.showsCancelButton = true
            roomAnimate(toggle: true)
        }
    }
}
