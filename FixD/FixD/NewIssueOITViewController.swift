//
//  NewIssueOITViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/13/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueOITViewController: UIViewController {
    
    @IBOutlet weak var buildingSB: UISearchBar!
    @IBOutlet weak var buildingTV: UITableView!
    @IBOutlet weak var floorSB: UISearchBar!
    @IBOutlet weak var floorTV: UITableView!
    @IBOutlet weak var roomSB: UISearchBar!
    @IBOutlet weak var roomTV: UITableView!
    
    let buildingList = ["Allen", "Brodhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    
    var searchBuilding = [String]()
    var searchingBuilding = false
    var searchFloor = [String]()
    var searchingFloor = false
    var searchRoom = [String]()
    var searchingRoom = false
    
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
}

extension NewIssueOITViewController: UITableViewDelegate, UITableViewDataSource {
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView == buildingTV {
//            buildingButton.setTitle("\(buildingList[indexPath.row])", for: .normal)
//            buildingAnimate(toggle: false)
//        }
//        if tableView == floorTV {
//            floorButton.setTitle("\(floorList[indexPath.row])", for: .normal)
//            floorAnimate(toggle: false)
//        }
//        if tableView == roomTV {
//            roomButton.setTitle("\(roomList[indexPath.row])", for: .normal)
//            roomAnimate(toggle: false)
//        }
//    }
}

extension NewIssueOITViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar == buildingSB {
            searchBuilding = buildingList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingBuilding = true
            buildingTV.reloadData()
        }
        else if searchBar == floorSB {
            searchFloor = floorList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingFloor = true
            floorTV.reloadData()
        }
        else if searchBar == roomSB {
            searchRoom = roomList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingRoom = true
            roomTV.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == buildingSB {
            searchingBuilding = false
            searchBar.text = ""
            buildingTV.reloadData()
        }
        else if searchBar == floorSB {
            searchingFloor = false
            searchBar.text = ""
            floorTV.reloadData()
        }
        else if searchBar == roomSB {
            searchingRoom = false
            searchBar.text = ""
            roomTV.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == buildingSB {
            buildingAnimate(toggle: true)
        }
        else if searchBar == floorSB {
            floorAnimate(toggle: true)
        }
        else if searchBar == roomSB {
            roomAnimate(toggle: true)
        }
    }
    
}
