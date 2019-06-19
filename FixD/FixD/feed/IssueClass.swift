//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueClass {
    
    private let issueID:Int
    
    private let myTitle:String
    private let description:String
    private let myLocation:String
    private let date:String
    private let issueImage:String
    private var upvoted = false
    private var pined = false
    
    private let myUser:UserProfile
    
    let locationImage:String = "locicon.png"
    let favoriteButton:String = "star.png"
    let likeButton:String = "upvote.png"
    let commentButton:String = "comments.png"
    
    private var myFavorites = 0
    private var myUpVotes = 0
    private var myComments = 0
    private var myListOfComments: Array<String> = Array()
    
    init(title:String, description:String, location:String, date:String, issueImage:String, user:UserProfile) {
        self.issueID = 0 //FIX this, make ID unique ID
        self.myTitle = title
        self.myLocation = location
        self.description = description
        self.date = date
        self.issueImage = issueImage
        self.myUser = user
    }
    
    func addUpVote(){
        if upvoted{
            myUpVotes -= 1
        }else {
            myUpVotes += 1
        }
        upvoted = !upvoted
    }
    
    func addFavorites(){
        if pined {
            myFavorites -= 1
        }else {
            myFavorites += 1
        }
        pined = !pined
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
    
    func getTitle() -> String {
        return myTitle
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getIssueImage() -> String {
        return issueImage
    }
    
    func getUser() -> UserProfile {
        return myUser
    }
    
    func getDate() -> String {
        return date
    }
    
    func getLocation() -> String {
        return myLocation
    }
}


