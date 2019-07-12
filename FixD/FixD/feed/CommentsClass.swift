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
//    var myUserNetId:String = ""
    
    init(body:String, userId:Int, issueId:Int, name:String, image:String){
        self.myBody = body
        self.myUserID = userId
        self.myIssueId = issueId
        self.myUserName = name
//        self.myUserNetId = netid
        self.myUserImage = image
    }
    
    
}
