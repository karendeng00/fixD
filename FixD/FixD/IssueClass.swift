//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueClass {
    
    let title:String
    let description:String
    let location:String
    let date:String
    let issueImage:String
    
    let userName:String
    let userImage:String
    
    let locationImage:String = "locicon.png"
    let favoriteButton:String = "star.png"
    let likeButton:String = "upvote.png"
    let commentButton:String = "comments.png"
    
    init(title:String, description:String, location:String, date:String, issueImage:String, userName:String, userImage:String) {
        self.title = title
        self.location = location
        self.description = description
        self.date = date
        self.issueImage = issueImage
        self.userName = userName
        self.userImage = userImage
        
        
    }
}


