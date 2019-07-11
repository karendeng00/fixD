//
//  NetworkAPI.swift
//  FixD
//
//  Created by Alejandro Meza on 7/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit
import Apollo


class NetworkAPI {

    let apollo = ApolloClient(url: URL(string: "https://fixd-test.cloud.duke.edu/graphql")!)

    func getListOfIssues(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        var myIssueList: Array<IssueClass> = []
        apollo.fetch(query: AllIssuesQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let issues = result?.data?.allIssues {
                for issue in issues {
                    myIssueList.append(IssueClass(
                        issueID: Int(issue.id)!,
                        title: issue.title!,
                        description: issue.description,
                        location: issue.location ?? "",
                        issueImage: issue.image ?? "",
                        user_id: issue.userId!,
                        likes: issue.likes!,
                        favorites: issue.favorites!,
                        dateNtime: issue.createdAt!))
                }
                DispatchQueue.main.async {
                    completionHandler(myIssueList)
                }
            }
        }
    }
    
    func getIssueById(id: Int, completionHandler: @escaping (IssueClass) -> ()) {
        apollo.fetch(query: IssueByIdQuery(id: Int(id))) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let i = result?.data?.issueById {
                let issue = IssueClass(issueID: Int(i.id)!,
                                       title: (i.title!),
                                       description: i.description,
                                       location: i.location ?? "",
                                       issueImage: i.image ?? "",
                                       user_id: (i.userId!),
                                       likes: (i.likes!),
                                       favorites: (i.favorites!),
                                       dateNtime: (i.createdAt!))
                DispatchQueue.main.async {
                    completionHandler(issue)
                }
            }
        }
    }
    
    func getListOfComments(id: Int, completionHandler: @escaping (Array<String>) -> ()) {
        var list:Array<String> = []
        self.apollo.fetch(query: CommentsByIssueQuery(issueId: id)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let result = result?.data?.commentsByIssue {
                for comment in result {
                    list.append(comment.body)
                }
                DispatchQueue.main.async {
                    completionHandler(list)
                }
            }
        }

    }
    
    func getUserByNetId(netid: String, completionHandler: @escaping (Bool) -> ()) {
        let user = UserProfile.account
        self.apollo.fetch(query: UserByNetIdQuery(netid: netid)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let u = result?.data?.userByNetId {
                user.setUp(id: Int(u.id)!, name: u.name!, netid: u.netid, image: u.picture!, phone: u.phone!)
                DispatchQueue.main.async {
                    completionHandler(false)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(true)
                }
            }
        }
        
    }
    
    func getUserById(id: Int, completionHandler: @escaping (UserProfile) -> ()) {
        var user:UserProfile?
        self.apollo.fetch(query: UserByIdQuery(id: id)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let u = result?.data?.userById {
                user = UserProfile(id: Int(u.id)!, name: (u.name!), netid: u.netid, image: u.picture!, phone: u.phone!)
                DispatchQueue.main.async {
                    completionHandler(user!)
                }
            }
        }
        
    }
    
    func buildIssue(issue :IssueClass) {
        apollo.perform(mutation: CreateIssueMutation(description: issue.getDescription(), image: issue.getIssueImage(), location: issue.getLocation(), userId: 1, title: issue.getTitle(), type: issue.getType(), likes: 0, favorites: 0, email: issue.getEmail(), phone: issue.getPhone(), alternatePhone: issue.getAltPhone(), group: "", urgency: issue.getUrgency(), sensitiveInfo: issue.getSensitiveInfo(), campus: issue.getCampus(), area: issue.getArea(), specificLocation: issue.getSpecificLocation(), roomNumber: issue.getRoom(), serviceAnimal: issue.getAnimal(), impact: issue.getImpact(), yourBuilding: issue.getBuildingFacilities(), yourFloor: issue.getFloorFacilities(), yourRoom: issue.getRoomFacilities(), requestType: issue.getRequestFor(), issueBuilding: issue.getBuildingService(), issueFloor: issue.getFloorService(), issueRoom: issue.getRoomService(), serviceType: issue.getServiceType(), fundCode: issue.getFundCode(), topic: "", name: issue.getName())) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("Error: ", err.response.statusCode)
            }
            else {
                print("success")
            }
        }
    }
}
