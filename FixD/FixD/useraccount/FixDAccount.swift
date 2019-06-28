//
//  Account.swift
//  FixD
//
//  Created by Ann Bailey on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class FixDAccount {
    
    private var myName: String
    private var myNetID: String
    private var myPosition: String
    private var myImage: String
    private var myTotalIssues: [String]
    private var myActiveIssues: [String]
    
    init(name: String) {
        myName = name
        myNetID = "IDK42"
        myPosition = "Reporter"
        myImage = "photo.png"
        myTotalIssues = []
        myActiveIssues = []
    }
    
    init(name: String, netID: String, position: String, image: String, totalIssues: [String], activeIssues: [String]) {
        myName = name
        myNetID = netID
        myPosition = position
        myImage = image
        myTotalIssues = totalIssues
        myActiveIssues = activeIssues
    }
    
}
