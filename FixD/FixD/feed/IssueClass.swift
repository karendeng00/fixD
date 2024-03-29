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
    private var liked = false
    private var favorited = false

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
    
    private var myUser = UserAccount.shared
    
    
    
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
        liked = myUser.listOfLikedIssues.contains(issueID)
        favorited = myUser.listOfFavedIssues.contains(issueID)
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
    
    //Is called when a service now issue is placed, since these values are needed.
    func defineServiceNowParams(urgency:String, impact:String, sensitive_info:String) {
        self.myUrgency = urgency
        self.myImpact = impact
        self.mySensitiveInfo = sensitive_info
    }
    
    //Called when an HRL requests is submitted to set parameters needed by HRL
    func defineHRLParams(campus:String, area:String, specific_location:String, room:String, animal:Bool) {
        self.myCampus = campus
        self.myArea = area
        self.mySpecificLocation = specific_location
        self.myRoom = room
        self.myAnimal = animal
    }
    
    //Is called when a facilites requests is submitted
    func defineEAMParamsP1(your_building:String, your_floor:String, your_room:String, request_for:String){
        self.myBuildingFacilities = your_building
        self.myFloorFacilities = your_floor
        self.myRoomFacilities = your_room
        self.myRequestFor = request_for
    }
    
    //This is called for the second page
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
    
    //When the like button is called, decreases or increases the like count, as well as removes from or adds to the user's list of liked issues
    //Finally, it will update the webserver
    func checkLiked(id: Int, nav: UINavigationController){
        if liked{
            self.myLikes -= 1
            myUser.listOfLikedIssues.remove(at: myUser.listOfLikedIssues.firstIndex(of: myIssueID)!)
            NetworkAPI().deleteLike(issueId: id, nav: nav)
            NetworkAPI().deleteLikeFromUser(userID: myUser.userId, issueID: myIssueID, nav: nav)
        }else {
            self.myLikes += 1
            myUser.listOfLikedIssues.append(myIssueID)
            NetworkAPI().addLike( issueId: id, nav: nav)
            NetworkAPI().addLikeToUser(userID: myUser.userId, issueID: myIssueID, nav: nav)
        }
        liked = !liked
    }
    
    func getUpVoteState() -> Bool {
        return liked
    }
    
    func getFavoritesState() -> Bool {
        return favorited
    }
    
    //When a star button is pressed, the method updates the favorite state, amount, and the user's favorite issue list. Then sends those updates to the webserver
    func checkFavorited(id: Int, nav: UINavigationController){
        if favorited {
            self.myFavorites -= 1
            myUser.listOfFavedIssues.remove(at: myUser.listOfFavedIssues.firstIndex(of: myIssueID)!)
            NetworkAPI().deleteFavorite(issueId: id, nav: nav)
            NetworkAPI().deleteFavFromUser(userID: myUser.userId, issueID: myIssueID, nav: nav)
        }else {
            self.myFavorites += 1
            myUser.listOfFavedIssues.append(myIssueID)
            NetworkAPI().addFavorite(issueId: id, nav: nav)
            NetworkAPI().addFavToUser(userID: myUser.userId, issueID: myIssueID, nav: nav)
        }
        favorited = !favorited
    }
    
    //Add a comment to the class as well as adds it ot the webserver
    func addComment(comment:String, image: String, issueId:Int, userId:Int, user_name: String, user_image: String, nav: UINavigationController, completionHandler: @escaping (Bool) -> ()) {
        NetworkAPI().createComment(comment: comment, image: image, issueId: issueId, userId: userId, nav: nav) {
            stall in
            
            DispatchQueue.main.async {
                completionHandler(true)
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


