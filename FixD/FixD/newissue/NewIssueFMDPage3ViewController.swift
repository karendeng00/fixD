//
//  NewIssueFMDPage3ViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/14/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueFMDPage3ViewController: UIViewController {
    
    @IBOutlet weak var buildingSelect2: UILabel!
    @IBOutlet weak var buildingSB2: UISearchBar!
    @IBOutlet weak var buildingTV2: UITableView!
    @IBOutlet weak var floorSelect2: UILabel!
    @IBOutlet weak var floorSB2: UISearchBar!
    @IBOutlet weak var floorTV2: UITableView!
    @IBOutlet weak var roomSelect2: UILabel!
    @IBOutlet weak var roomSB2: UISearchBar!
    @IBOutlet weak var roomTV2: UITableView!
    
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
        buildingTV2.isHidden = true
        floorTV2.isHidden = true
        roomTV2.isHidden = true
    }
    
    func buildingAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.buildingTV2.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.buildingTV2.isHidden = true
            }
        }
    }
    
    func floorAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.floorTV2.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.floorTV2.isHidden = true
            }
        }
    }
    
    func roomAnimate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.roomTV2.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.roomTV2.isHidden = true
            }
        }
    }
}

extension NewIssueFMDPage3ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == buildingTV2 {
            if searchingBuilding {
                return searchBuilding.count
            }
            else {
                return buildingList.count
            }
        }
        else if tableView == floorTV2 {
            if searchingFloor{
                return searchFloor.count
            }
            else {
                return floorList.count
            }
        }
        else if tableView == roomTV2 {
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
        if tableView == buildingTV2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell2", for: indexPath)
            if searchingBuilding {
                cell.textLabel?.text = searchBuilding[indexPath.row]
            }
            else {
                cell.textLabel?.text = buildingList[indexPath.row]
            }
            returnCell = cell
        }
        else if tableView == floorTV2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell2", for: indexPath)
            if searchingFloor {
                cell.textLabel?.text = searchFloor[indexPath.row]
            }
            else {
                cell.textLabel?.text = floorList[indexPath.row]
            }
            returnCell = cell
        }
        else if tableView == roomTV2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell2", for: indexPath)
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
        if tableView == buildingTV2 {
            if buildingTextDidChange {
                self.buildingSelect2.text = String("\(searchBuilding[indexPath.row])")
            }
            else {
                self.buildingSelect2.text = String("\(buildingList[indexPath.row])")
            }
            buildingAnimate(toggle: false)
            buildingSB2.showsCancelButton = true
            buildingChosen = true
            searchingBuilding = false
        }
        if tableView == floorTV2 {
            if floorTextDidChange {
                self.floorSelect2.text = String("\(searchFloor[indexPath.row])")
            }
            else {
                self.floorSelect2.text = String("\(floorList[indexPath.row])")
            }
            floorAnimate(toggle: false)
            floorSB2.showsCancelButton = true
            floorChosen = true
            searchingFloor = false
        }
        if tableView == roomTV2 {
            if roomTextDidChange {
                self.roomSelect2.text = ("\(searchRoom[indexPath.row])")
            }
            else {
                self.roomSelect2.text = ("\(roomList[indexPath.row])")
            }
            roomAnimate(toggle: false)
            roomSB2.showsCancelButton = true
            roomChosen = true
            searchingRoom = false
        }
    }
}

extension NewIssueFMDPage3ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar == buildingSB2 {
            buildingAnimate(toggle: true)
            searchBuilding = buildingList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingBuilding = true
            buildingTextDidChange = true
            buildingTV2.reloadData()
        }
        else if searchBar == floorSB2 {
            floorAnimate(toggle: true)
            searchFloor = floorList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingFloor = true
            floorTextDidChange = true
            floorTV2.reloadData()
        }
        else if searchBar == roomSB2 {
            roomAnimate(toggle: true)
            searchRoom = roomList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchingRoom = true
            roomTextDidChange = true
            roomTV2.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == buildingSB2 {
            buildingSB2.showsCancelButton = true
            buildingAnimate(toggle: true)
        }
        if searchBar == floorSB2 {
            floorSB2.showsCancelButton = true
            floorAnimate(toggle: true)
        }
        if searchBar == roomSB2 {
            roomSB2.showsCancelButton = true
            roomAnimate(toggle: true)
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == buildingSB2 {
            buildingSB2.text = ""
            buildingSB2.showsCancelButton = false
            if buildingChosen {
                buildingSelect2.text = ""
                buildingTV2.reloadData()
                buildingAnimate(toggle: true)
            }
        }
        if searchBar == floorSB2 {
            floorSB2.text = ""
            floorSB2.showsCancelButton = false
            if floorChosen {
                floorSelect2.text = ""
                floorTV2.reloadData()
                floorAnimate(toggle: true)
            }
        }
        if searchBar == roomSB2 {
            roomSB2.text = ""
            roomSB2.showsCancelButton = false
            if roomChosen {
                roomSelect2.text = ""
                roomTV2.reloadData()
                roomAnimate(toggle: true)
            }
        }
    }
}
