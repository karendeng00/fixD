//
//  NewIssueOITViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/13/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueOITViewController: UIViewController {

    @IBOutlet weak var buildingButton: UIButton!
    @IBOutlet weak var buildingTV: UITableView!
    @IBOutlet weak var floorButton: UIButton!
    @IBOutlet weak var floorTV: UITableView!
    @IBOutlet weak var roomButton: UIButton!
    @IBOutlet weak var roomTV: UITableView!
    
    let buildingList = ["Allen", "Brodhead Center", "Bryan Center", "Craven", "Few", "Perkins"]
    let floorList = ["1", "2", "3"]
    let roomList = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildingTV.isHidden = true
        floorTV.isHidden = true
        roomTV.isHidden = true
    }
    
    @IBAction func buildingButtonDrop(_ sender: Any) {
        if buildingTV.isHidden {
            buildingAnimate(toggle: true)
        }
        else {
            buildingAnimate(toggle: false)
        }
    }
    
    @IBAction func floorButtonDrop(_ sender: Any) {
        if floorTV.isHidden {
            floorAnimate(toggle: true)
        }
        else {
            floorAnimate(toggle: false)
        }
    }
    
    @IBAction func roomButtonDrop(_ sender: Any) {
        if roomTV.isHidden {
            roomAnimate(toggle: true)
        }
        else {
            roomAnimate(toggle: false)
        }
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
            return buildingList.count
        }
        else if tableView == floorTV {
            return floorList.count
        }
        else if tableView == roomTV {
            return roomList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == buildingTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath)
            cell.textLabel?.text = buildingList[indexPath.row]
            returnCell = cell
        }
        else if tableView == floorTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
            cell.textLabel?.text = floorList[indexPath.row]
            returnCell = cell
        }
        else if tableView == roomTV {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
            cell.textLabel?.text = roomList[indexPath.row]
            returnCell = cell
        }
        return returnCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == buildingTV {
            buildingButton.setTitle("\(buildingList[indexPath.row])", for: .normal)
            buildingAnimate(toggle: false)
        }
        if tableView == floorTV {
            floorButton.setTitle("\(floorList[indexPath.row])", for: .normal)
            floorAnimate(toggle: false)
        }
        if tableView == roomTV {
            roomButton.setTitle("\(roomList[indexPath.row])", for: .normal)
            roomAnimate(toggle: false)
        }
    }
}
