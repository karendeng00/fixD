//
//  CommentsClass.swift
//  FixD
//
//  Created by Alejandro Meza on 7/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit

class CommentsClass {
    
    //This class contains the data to represent a comment in our app
    var myBody:String = ""
    var myImage:String = ""
    var myUserID:Int = 0
    var myIssueId: Int = 0
    var myUserName:String = ""
    var myUserImage:String = ""

    
    init(body:String, image:String, userId:Int, issueId:Int, name:String, user_image:String){
        self.myBody = body
        self.myImage = image
        self.myUserID = userId
        self.myIssueId = issueId
        self.myUserName = name
        self.myUserImage = user_image
    }
    
    
}
