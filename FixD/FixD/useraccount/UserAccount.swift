//
//  UserAccount.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit

//This class is a singleton object that initializes the User (the person using the app)
//It fetches information from the web. If the user is recognized, it loads the user using the netid.
//Otherwise, it creates a new user on the database.
// Note: THIS IS NOT the same as the UserClass. This is the User that owns the account.
// There exists only one version of this account.
class UserAccount{

    var userId:Int = 0
    var userDuid:String = ""
    var userName:String = ""
    var userNetId:String = ""
    var userImage:String = ""
    var userPhone:String = ""
    var newUser:Bool = false
    var listOfLikedIssues:[Int] = []
    var listOfFavedIssues:[Int] = []
    
    static let shared = UserAccount()

    private init(){}
    
    //Initializes the user account.
    func setUp(id: Int, duid:String, netid:String, name:String, phone: String, picture: String, myLikes: [Int], myFavorites: [Int]) {
        self.userId = id
        self.userDuid = duid
        self.userName = name
        self.userNetId = netid
        self.userPhone = phone
        self.userImage = picture
        self.listOfLikedIssues = myLikes
        self.listOfFavedIssues = myFavorites
    }
    
    //Returns netID
    func getNetId() -> String {
        return userNetId
    }
    
    //Returns userID from the database.
    func getUserId() -> Int {
        return userId
    }
    
    //Returns username
    func getUserName() -> String {
        return userName
    }
    
    //Returns userImage
    func getUserImage() -> String {
        return userImage
    }

}

