//
//  UserProfile.swift
//  FixD
//
//  Created by Alejandro Meza on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import Apollo

class UserProfile {

    let apollo = ApolloClient(url: URL(string: "https://fixd-test.cloud.duke.edu/graphql")!)
    
    var userId:Int = 0
    var userName:String = ""
    var userNetId:String = ""
    var userImage:String = ""
    var userPhone:String = ""
    var newUser:Bool = false
    
    static let account = UserProfile()

    private init(){}
    
    //In the future, connect to the database
    func setUp(id:Int, name:String, netid:String, image:String, phone:String) {
        self.userId = id
        self.userName = name
        self.userNetId = netid
        self.userImage = image
        self.userPhone = phone
    }
    
    func newUser(name: String, netid: String, phone: String, picture: String) {
        var id = 0
        apollo.perform(mutation: CreateUserMutation(name: name, netid: netid, phone: phone, picture: picture))  { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            let u = result?.data?.createUser
            id = Int(u!.id)!
        }
        self.setUp(id: id, name: name, netid: netid, image: picture, phone: phone)
    }
    
    func getNetId() -> String {
        return userNetId
    }
}

