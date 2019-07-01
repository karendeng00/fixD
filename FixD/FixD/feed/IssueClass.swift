//
//  IssueClass.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit

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
    private var myUpVotes: Int = 0
    private var myComments: Int = 0
    private var myImages: Int = 0
    private var myListOfComments: Array<String> = Array()
    private var myListOfImages: Array<UIImage> = Array()
    
    
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
        self.myImages = myListOfImages.count
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
    
    //Empty Object constructor
    init() {}
    
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
    
    func addImage(image:UIImage) {
        myListOfImages.append(image)
        myImages = myImages + 1
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
    
    func getNumberOfImages() -> Int {
        return myImages
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

    func getLocation() -> String {
        return myLocation
    }
    
    
    func buildIssue() {
        let params = buildParams(type:myType)
        let url = URL(string: "http://localhost:3000/createIssueMobile")! //change the url
        //create the session object
        let session = URLSession.shared
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    private func buildParams(type:String) -> [String:Any] {
        if myType == "SnIssue" {
            return ["title": self.getTitle(),
                          "description": self.getDescription(),
                          "name": self.getName(),
                          "type": self.getType(),
                          "email": self.getEmail(),
                          "phone": self.getPhone(),
                          "alternate_phone": self.getAltPhone(),
                          "urgency": self.getUrgency(),
                          "impact": self.getImpact(),
                          "sensitive_info": self.getSensitiveInfo(),
                          "user_id": 1]
                as [String: Any]
        }
        else if myType == "HrlIssue" {
            return ["title": self.getTitle(),
                    "description": self.getDescription(),
                    "name": self.getName(),
                    "type": self.getType(),
                    "email": self.getEmail(),
                    "phone": self.getPhone(),
                    "alternate_phone": self.getAltPhone(),
                    "campus": self.getCampus(),
                    "area": self.getArea(),
                    "specific_location": self.getSpecificLocation(),
                    "room_number": self.getRoom(),
                    "service_animal": self.getAnimal(),
                    "user_id": 1]
                as [String: Any]
        }
        else if myType == "EamIssue" {
            return ["title": self.getTitle(),
                    "description": self.getDescription(),
                    "name": self.getName(),
                    "type": self.getType(),
                    "email": self.getEmail(),
                    "phone": self.getPhone(),
                    "alternate_phone": self.getAltPhone(),
                    "your_building": self.getBuildingFacilities(),
                    "your_floor": self.getFloorFacilities(),
                    "your_room": self.getRoomFacilities(),
                    "request_type": self.getRequestFor(),
                    "issue_building": self.getBuildingService(),
                    "issue_floor": self.getFloorService(),
                    "issue_room": self.getRoomService(),
                    "service_type": self.getServiceType(),
                    "fund_code": self.getFundCode(),
                    "user_id": 1]
                as [String: Any]
        }
        else {
            return ["Error":"Error"] //should never reach this part of the code
        }
    }
        
}


