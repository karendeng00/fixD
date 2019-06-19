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
    private var pinned = false
    
    private let myUser:UserProfile
    
    let locationImage:String = "locicon.png"
    let favoriteButton:String = "star.png"
    let likeButton:String = "upvote.png"
    let commentButton:String = "comments.png"
    
    private var myFavorites: Int
    private var myUpVotes: Int
    private var myComments: Int
    private var myListOfComments: Array<String> = Array()
    
    init(ID: Int, title:String, description:String, location:String, date:String, issueImage:String, user:UserProfile, upVotes: Int, favorites: Int) {
        self.issueID = ID
        self.myTitle = title
        self.myLocation = location
        self.description = description
        self.date = date
        self.issueImage = issueImage
        self.myUser = user
        self.myFavorites = favorites
        self.myUpVotes = upVotes
        self.myComments = myListOfComments.count
    }
    
    func addUpVote(){
        if upvoted{
            myUpVotes -= 1
        }else {
            myUpVotes += 1
        }
        upvoted = !upvoted
    }
    
    func getUpVoteState() -> Bool {
        return upvoted
    }
    
    func getFavoritesState() -> Bool {
        return pinned
    }
    
    func addFavorites(){
        if pinned {
            myFavorites -= 1
        }else {
            myFavorites += 1
        }
        pinned = !pinned
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


