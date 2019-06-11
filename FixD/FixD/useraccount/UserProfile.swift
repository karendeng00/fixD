//
//  UserProfile.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation


class UserProfile {

    let userName:String
    let userImage:String
    
    var listOfComments: Array<String> = Array()
    
    //In the future, connect to the database
    init(name:String, image:String) {
        self.userName = name
        self.userImage = image
    }
}
