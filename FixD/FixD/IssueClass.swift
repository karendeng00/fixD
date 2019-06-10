//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueClass {
    
    let issueID:Int
    
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
    
    var myFavorites = 0
    var myUpVotes = 0
    var myComments = 0
    var myListOfComments: Array<String> = Array()
    
    init(title:String, description:String, location:String, date:String, issueImage:String, userName:String, userImage:String) {
        self.issueID = 0 //FIX this, make ID unique ID
        self.title = title
        self.location = location
        self.description = description
        self.date = date
        self.issueImage = issueImage
        self.userName = userName
        self.userImage = userImage
    }
    
    func addFavorite(){
        myFavorites = myFavorites + 1
    }
    
    func addUpVote(){
        myUpVotes = myUpVotes + 1
    }
    
    func addComment(comment:String){
        myListOfComments.append(comment)
        myComments = myComments + 1
    }
    
    func getFavorites() -> Int {
        return myFavorites
    }
    
    func getUpVotes() -> Int {
        return myUpVotes
    }
    
    func getNumberOfComments() -> Int {
        return myComments
    }
    
    func getListOfComments() -> Array<String> {
        return myListOfComments
    }
}


