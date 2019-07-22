//
//  UserAccount.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

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
    var listOfLikeIssues:[String] = []
    
    static let shared = UserAccount()

    private init(){}
    
    //In the future, connect to the database
    func setUp(id: Int, duid:String, netid:String, name:String, phone: String, picture: String) {
        self.userId = 0
        self.userDuid = duid
        self.userName = name
        self.userNetId = netid
        self.userPhone = phone
        self.userImage = picture
    }
    
    func newUser(duid:String, netid: String, name: String, phone: String, picture: String){
        NetworkAPI().createUser(name: name, netid: netid, phone: phone, picture: picture) { id in
            self.setUp(id: id, duid: duid, netid: netid, name: name, phone: phone, picture: picture)
        }
        
    }
    
    func getNetId() -> String {
        return userNetId
    }
}

