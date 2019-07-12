//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit
import Apollo

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
    

    private var myUserID:Int = 0
    private var myType:String = ""

    private var myDate:String = ""
    private var myTime:String = ""
    
    //Service Now Params
    private var myUrgency:String = ""
    private var myImpact:String = ""
    private var mySensitiveInfo:String = ""
    
    //HRL Params
    private var myCampus = ""
    private var myArea = ""
    private var myRoom = ""
    private var mySpecificLocation = ""
    private var myAnimal = false
    
    //EAM Params
    private var myBuildingFacilities = ""
    private var myFloorFacilities = ""
    private var myRoomFacilities = ""
    private var myRequestFor = ""
    private var myBuildingService = ""
    private var myFloorService = ""
    private var myRoomService = ""
    private var myServiceType = ""
    private var myFundCode = ""
    
    private var myFavorites: Int = 0
    public var myLikes: Int = 0
    private var myListOfComments: [String] = []
    private var myListOfImages: Array<UIImage> = Array()
    
    private let apollo = ApolloClient(url: URL(string: "https://fixd-test.cloud.duke.edu/graphql")!)
    
    //not sure why we don't have type
    init(issueID:Int, title:String, description:String, location:String, issueImage:String, user_id:Int, likes: Int, favorites: Int, dateNtime:String, type: String) {
        self.myIssueID = issueID
        self.myTitle = title
        self.myLocation = location
        self.myDescription = description
        self.myIssueImage = issueImage
        self.myUserID = user_id
        self.myFavorites = favorites
        self.myLikes = likes
        self.myType = type
        NetworkAPI().getListOfComments(id: Int(issueID)){ comments in
            self.myListOfComments = comments
        }
        
        setUpDateAndTime(s: dateNtime)
    }
    
    //For Basic Initialization
    init(name:String, email:String, phone:String, altPhone:String, title:String, description:String){
        self.myName = name
        self.myEmail = email
        self.myPhone = phone
        self.myAltPhone = altPhone
        self.myTitle = title
        self.myDescription = description
    }
    
    //Empty Object constructor
    init() {}
    
    //For ?
    init(title:String, description:String, location:String, issueImage:String, user_id:Int, likes: Int, favorites: Int) {
        self.myTitle = title
        self.myLocation = location
        self.myDescription = description
        self.myIssueImage = issueImage
        self.myUserID = user_id
        self.myFavorites = favorites
        self.myLikes = likes
    }

    
    //Set type of the Issue (SN, HRL, Dining, PT, EAM)
    func setType(type:String) {
        self.myType = type
    }
    
    func defineServiceNowParams(urgency:String, impact:String, sensitive_info:String) {
        self.myUrgency = urgency
        self.myImpact = impact
        self.mySensitiveInfo = sensitive_info
    }
    
    func defineHRLParams(campus:String, area:String, specific_location:String, room:String, animal:Bool) {
        self.myCampus = campus
        self.myArea = area
        self.mySpecificLocation = specific_location
        self.myRoom = room
        self.myAnimal = animal
    }
    
    func defineEAMParamsP1(your_building:String, your_floor:String, your_room:String, request_for:String){
        self.myBuildingFacilities = your_building
        self.myFloorFacilities = your_floor
        self.myRoomFacilities = your_room
        self.myRequestFor = request_for
    }
    
    func defineEAMParamsP2(service_building:String, service_floor:String, service_room:String, service_type:String, fund_code:String) {
        self.myBuildingService = service_building
        self.myFloorService = service_floor
        self.myRoomService = service_room
        self.myServiceType = service_type
        self.myFundCode = fund_code
    }
    
    func setUpDateAndTime(s: String) {
        var list = s.split(separator: " ")
        
        //Setting date in DD/MM/YY format
        var date = String(list[0]).split(separator: "-")
        var year = Array(String(date[0]))
        self.myDate = "\(String(date[1]))/\(String(date[2]))/\(String(year[2]))\(String(year[3]))"
        
        //Removing the seconds to the time
        var time = String(list[1]).split(separator: ":")
        self.myTime = "\(String(time[0])):\(String(time[1]))"
    }
    
    func checkLiked(id: Int){
        if upvoted{
            self.myLikes -= 1
            apollo.perform(mutation: DeleteLikeFromIssueMutation(id:id)) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print(err.response.statusCode)
                }
            }
        }else {
            self.myLikes += 1
            apollo.perform(mutation: AddLikeToIssueMutation(id:id)) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print(err.response.statusCode)
                }
            }
        }
        upvoted = !upvoted
    }
    
    func getUpVoteState() -> Bool {
        return upvoted
    }
    
    func getFavoritesState() -> Bool {
        return pinned
    }
    
    func checkFavorited(id: Int){
        if pinned {
            self.myFavorites -= 1
            apollo.perform(mutation: DeleteFavoriteFromIssueMutation(id: id)) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print(err.response.statusCode)
                }
            }
        }else {
            self.myFavorites += 1
            apollo.perform(mutation: AddFavoriteToIssueMutation(id: id)) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print(err.response.statusCode)
                }
            }
        }
        pinned = !pinned
    }
    
    func addComment(comment:String, issueId:Int, userId:Int){
        myListOfComments.append(comment)
        apollo.perform(mutation: CreateCommentMutation(body: comment, userId: userId, issueId: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func addImage(image:UIImage) {
        myListOfImages.append(image)
    }
    
    func getFavorites() -> Int {
        return myFavorites
    }
    
    func getUpVotes() -> Int {
        return myLikes
    }
    
    func getNumberOfComments() -> Int {
        return myListOfComments.count
    }
    
    func getNumberOfImages() -> Int {
        return myListOfImages.count
    }

    
    func getListOfComments() -> Array<String> {
        return myListOfComments
    }
    
    func getListOfImages() -> Array<UIImage> {
        return myListOfImages
    }
    
    func setID(id:Int) {
        self.myIssueID = id
    }
    
    func getID() -> Int {
        return myIssueID
    }
    
    func getUserId() -> Int {
        return myUserID
    }
    
    func getName() ->String {
        return myName
    }
    
    func getEmail() -> String {
        return myEmail
    }
    
    func getPhone() ->String {
        return myPhone
    }
    
    func getAltPhone() ->String {
        return myAltPhone
    }
    
    func getIssueDate() -> String {
        return myDate
    }
    
    func getIssueTime() -> String {
        return myTime
    }
    
    func getUrgency() -> String {
        return myUrgency
    }
    
    func getImpact() -> String {
        return myImpact
    }
    
    func getSensitiveInfo() -> String {
        return mySensitiveInfo
    }
    
    func getCampus() -> String {
        return myCampus
    }
    
    func getArea() -> String {
        return myArea
    }
    
    func getSpecificLocation() -> String {
        return mySpecificLocation
    }
    
    func getRoom() -> String {
        return myRoom
    }
    
    func getAnimal() -> Bool {
        return myAnimal
    }
    
    func getBuildingFacilities() -> String {
        return myBuildingFacilities
    }
    
    func getFloorFacilities() -> String {
        return myFloorFacilities
    }
    
    func getRoomFacilities() -> String {
        return myRoomFacilities
    }
    
    func getRequestFor() -> String {
        return myRequestFor
    }
    
    func getBuildingService() -> String {
        return myBuildingService
    }
    
    func getFloorService() -> String {
        return myFloorService
    }
    
    func getRoomService() -> String {
        return myRoomService
    }
    
    func getServiceType() -> String {
        return myServiceType
    }
    
    func getFundCode() -> String {
        return myFundCode
    }
    
    func getType() ->String {
        return myType
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
    
    func getMyDate() -> String {
        return myDate
    }

    func getLocation() -> String {
        return myLocation
    }
    
    
    
        
}


