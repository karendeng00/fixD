//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueClass {
    
    private var myIssueID:Int = 0
    
    
    private var myName:String = ""
    private var myEmail:String = ""
    private var myPhone:String = ""
    private var myAltPhone:String = ""
    private var myTitle:String = ""
    private var myDescription:String = ""
    private var myLocation:String = ""
    private var myIssueImage:String = ""
    private var upvoted = false
    private var pinned = false
    
//    private let myUser:UserProfile
    private var myUserID:Int = 0
    private var myType:String = ""
    
    
    //Service Now Params
    private var myUrgency:String = ""
    private var myImpact:String = ""
    private var mySensitiveInfo:String = ""
    
    
    let locationImage:String = "locicon.png"
    let favoriteButton:String = "star.png"
    let likeButton:String = "upvote.png"
    let commentButton:String = "comments.png"
    
    private var myFavorites: Int = 0
    private var myUpVotes: Int = 0
    private var myComments: Int = 0
    private var myListOfComments: Array<String> = Array()
    
    
    //For Loading
    init(issueID:Int, title:String, description:String, location:String, issueImage:String, user_id:Int, upVotes: Int, favorites: Int) {
        self.myIssueID = issueID
        self.myTitle = title
        self.myLocation = location
        self.myDescription = description
        self.myIssueImage = issueImage
        self.myUserID = user_id
        self.myFavorites = favorites
        self.myUpVotes = upVotes
        self.myComments = myListOfComments.count
    }
    
    //For Basic Initialization
    init(name:String, email:String, phone:String, altPhone:String, title:String, description:String){
        self.myName = name
        self.myEmail = email
        self.myPhone = phone
        self.myAltPhone = altPhone
        self.myTitle = title
        self.myDescription = description
        self.myComments = myListOfComments.count
    }
    
    //For ?
    init(title:String, description:String, location:String, issueImage:String, user_id:Int, upVotes: Int, favorites: Int) {
        self.myTitle = title
        self.myLocation = location
        self.myDescription = description
        self.myIssueImage = issueImage
        self.myUserID = user_id
        self.myFavorites = favorites
        self.myUpVotes = upVotes
        self.myComments = myListOfComments.count
    }
    
    
    func setType(type:String) {
        self.myType = type
    }
    
    func defineServiceNowParams(urgency:String, impact:String, sensitive_info:String) {
        self.myUrgency = urgency
        self.myImpact = impact
        self.mySensitiveInfo = sensitive_info
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
    
    func setID(id:Int) {
        self.myIssueID = id
    }
    
    func getID() -> Int {
        return myIssueID
    }
    
    func getTitle() -> String {
        return myTitle
    }
    
    func getDescription() -> String {
        return myDescription
    }
    
    func getIssueImage() -> String {
        return myIssueImage
    }
    
//    func getUser() -> UserProfile {
//        return myUser
//    }

    func getLocation() -> String {
        return myLocation
    }
}


