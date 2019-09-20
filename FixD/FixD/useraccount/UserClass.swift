//
//  UserClass.swift
//  FixD
//
//  Created by Alejandro Meza on 7/17/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation


//This class is the "User" object used to instantiate Issue objects.
// Note: THIS IS NOT the same as UserAccount. This only loads user information to display
// with Issues.
class UserClass {
    
    var userId:Int = 0
    var userName:String = ""
    var userNetId:String = ""
    var userImage:String = ""
    var userPhone:String = ""
    
    
    //Instantiate user with variables from the database.
    init(id:Int, name:String, netid:String, image:String, phone:String) {
        self.userId = id
        self.userName = name
        self.userNetId = netid
        self.userImage = image
        self.userPhone = phone
    }
    
    //Method used to get the user's netid for display.
    func getNetId() -> String {
        return userNetId
    }
}

