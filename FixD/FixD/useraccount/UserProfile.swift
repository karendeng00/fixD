//
//  UserProfile.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation


class UserProfile {

    var userId:Int = 0
    var userName:String = ""
    var userNetId:String = ""
    var userImage:String = ""
    var userPhone:String = ""
    var newUser:Bool = false
    

    //In the future, connect to the database
    init(name:String, netid:String, image:String, phone:String) {
        self.userName = name
        self.userNetId = netid
        self.userImage = image
        self.userPhone = phone
    }
    
    init(newUser: Bool){
        self.newUser = newUser
    }
    
    func isNewUser() -> Bool {
        return newUser
    }
    
    func getNetId() -> String {
        return userNetId
    }
}

