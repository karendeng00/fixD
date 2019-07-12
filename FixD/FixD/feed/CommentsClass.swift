//
//  CommentsClass.swift
//  FixD
//
//  Created by Alejandro Meza on 7/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class CommentsClass {
    
    var myBody:String = ""
    var myUserID:Int = 0
    var myIssueId: Int = 0
    var myUserName:String = ""
    var myUserImage:String = ""
    var myUserNetId:String = ""
    
    init(body:String, userId:Int, issueId:Int){
        getUserInfo(userId: userId)
        self.myBody = body
        self.myUserID = userId
        self.myIssueId = issueId
    }
    
    private func getUserInfo(userId:Int) {
        NetworkAPI().getUserById(id: userId) { user in
            self.myUserName = user.userName
            self.myUserImage = user.userImage
            self.myUserNetId = user.userNetId
        }
    }
    
    
    
}
