//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit

class IssueClass: Equatable, Hashable {
    
    private var myIssueID:Int = 0
    
    //Common Parameters
    var myUserName:String = ""
    var myUserImage:String = ""
    
    private var myName:String = ""
    private var myEmail:String = ""
    private var myPhone:String = ""
    private var myAltPhone:String = ""
    private var myTitle:String = ""
    private var myDescription:String = ""
    private var myLocation:String = ""
    private var myIssueImage:String = ""
    var liked = false
    var favorited = false

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
    private var myComments: [CommentsClass] = []
    private var myListOfImages: Array<UIImage> = Array()
    
    
    
    //For Loading
    init(issueID:Int, title:String, description:String, location:String, issueImage:String, user_id:Int, likes: Int, favorites: Int, dateNtime:String, comments: [CommentsClass], userName:String, userImage: String, type: String) {
        self.myIssueID = issueID
        self.myTitle = title
        self.myLocation = location
        self.myDescription = description
        self.myIssueImage = issueImage
        self.myUserID = user_id
        self.myFavorites = favorites
        self.myLikes = likes
        setUpDateAndTime(s: dateNtime)
        self.myComments = comments
        self.myUserName = userName
        self.myUserImage = userImage
        self.myType = type
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

    static func == (lhs: IssueClass, rhs: IssueClass) -> Bool {
        return lhs.myIssueID == rhs.myIssueID
    }
    
    static func != (lhs: IssueClass, rhs: IssueClass) -> Bool {
        return lhs.myIssueID != rhs.myIssueID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(myIssueID)
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
        if liked{
            self.myLikes -= 1
            NetworkAPI().deleteLike(issueId: id)
        }else {
            self.myLikes += 1
            NetworkAPI().addLike( issueId: id)
        }
        liked = !liked
    }
    
    func getUpVoteState() -> Bool {
        return liked
    }
    
    func getFavoritesState() -> Bool {
        return favorited
    }
    
    func checkFavorited(id: Int){
        if favorited {
            self.myFavorites -= 1
            NetworkAPI().deleteFavorite(issueId: id)
        }else {
            self.myFavorites += 1
            NetworkAPI().addFavorite(issueId: id)
        }
        favorited = !favorited
    }
    
    func addComment(comment:String, image: UIImage, issueId:Int, userId:Int, user_name: String, user_image: String, nav: UINavigationController){
        myComments.append(CommentsClass(body: comment, image: image, userId: userId, issueId: issueId, name: user_name, user_image: user_image))
        NetworkAPI().createComment(comment: comment, image: "path", issueId: issueId, userId: userId, nav: nav)
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
        return myComments.count
    }
    
    func getNumberOfImages() -> Int {
        return myListOfImages.count
    }

    
    func getListOfComments() -> Array<CommentsClass> {
        return myComments
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
    
    func getMyDate() -> String {
        return myDate
    }

    func getLocation() -> String {
        return myLocation
    }
    
    
    
        
}


