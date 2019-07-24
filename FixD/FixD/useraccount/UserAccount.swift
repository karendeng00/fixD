//
//  UserAccount.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit
// Note: THIS IS NOT THE SAME AS UserClass. This is the User that owns the account.
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
    
    //In the future, connect to the database
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
    
    func newUser(nav: UINavigationController, duid:String, netid: String, name: String, phone: String, picture: String){
        NetworkAPI().createUser(nav: nav, name: name, netid: netid, phone: phone, picture: picture) { id,error in
            self.setUp(id: id, duid: duid, netid: netid, name: name, phone: phone, picture: picture, myLikes: [], myFavorites: [])
        }
    }
    
    func getNetId() -> String {
        return userNetId
    }
    
    func getUserId() -> Int {
        return userId
    }
    
    func getUserName() -> String {
        return userName
    }
    
    func getUserImage() -> String {
        return userImage
    }

}

