//
//  TestViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/21/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit


import Foundation

class TestViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IssuePasser().passData()

        // Do any additional setup after loading the view.
    }
    
}
    /*
    // MARK: - Navigation

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

