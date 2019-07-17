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

    
    //    let apollo = ApolloClient(url: URL(string: "https://fixd-test.cloud.duke.edu/graphql")!)
    //    let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
    
    let apollo: ApolloClient = {
        var token = OAuthService.shared.getAccessToken() ?? ""
        print(token)
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
        let kongURL = "https://events-attendance-backend.api-test.oit.duke.edu/graphql"
        let url = URL(string: kongURL)!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()

    
    // This method fetches information from IDMS to populate user. If the user already exists
    // in the system, then the user is loaded. Otherwise, a new user is created with the
    // information loaded from IDMS. The method instantiantes a singleton UserAccount.
    func getUserDuid(nav: UINavigationController, completionHandler: @escaping (String) -> Void) {
        //Fetch the DUID
        self.apollo.fetch(query: GetDuidQuery(), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
            print((result?.data?.getDuid)!)
            DispatchQueue.main.async{
                completionHandler((result?.data?.getDuid)!)
            }
        }
    }
    
    //This method checks for e
    func fetchUserData(nav: UINavigationController, completionHandler: @escaping ([String]) -> Void){
        getUserDuid(nav: nav) { duid in
        // Get the User info (comes back as a String array).
            self.apollo.fetch(query: GetUserInfoQuery(duid: duid)) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print(err.response.statusCode)
                }
                DispatchQueue.main.async{
                    completionHandler((result?.data?.getUserInfo)!) // catch errors
                }
            }
        }
    }
            
    func setUpUser(nav: UINavigationController) {
        let user = UserAccount.account
        fetchUserData(nav: nav) { info in
            // Use netID to check if user exists
            self.apollo.fetch(query: UserByNetIdQuery(netid: info[0])) { (result, error) in
                if let err = error as? GraphQLHTTPResponseError {
                    print (err.response.statusCode)
                }
                // If user exists, instantiate User with info
                if let u = result?.data?.userByNetId {
                    user.setUp(id: Int(u.id)!, duid: info[1], netid: u.netid, name: u.name!, phone: u.phone ?? "", picture: u.picture ?? "")
                }
                // If user does not exist, create a new User and instantiate
                else {
                    user.newUser(duid:info[1], netid: info[0], name: info[2] , phone: "", picture: "")
                }
            }
        }
    }
    
    func getListOfIssues(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        var myIssueList: Array<IssueClass> = []
        apollo.fetch(query: AllIssuesQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let issues = result?.data?.allIssues {
                for issue in issues {
                    var listOfComments:[CommentsClass] = []
                    if let comments = issue.comments {
                        for comment in comments {
                            listOfComments.append(CommentsClass(body: comment.body ?? "", image: "", userId: comment.userId, issueId: comment.issueId, name: issue.user.name!, user_image: issue.user.picture ?? ""))
                        }
                    }
                    myIssueList.append(IssueClass(
                        issueID: Int(issue.id)!,
                        title: issue.title!,
                        description: issue.description,
                        location: issue.location ?? "",
                        issueImage: issue.image ?? "",
                        user_id: issue.userId!,
                        likes: issue.likes!,
                        favorites: issue.favorites!,
                        dateNtime: issue.createdAt!,
                        comments: listOfComments,
                        userName: issue.user.name!,
                        userImage: issue.user.picture ?? "",
                        type: issue.type!))
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
                var listOfComments:[CommentsClass] = []
                if let comments = i.comments {
                    for comment in comments {
                        listOfComments.append(CommentsClass(body: comment.body ?? "", image: "", userId: comment.userId, issueId: comment.issueId, name: i.user.name!, user_image: i.user.picture ?? ""))
                    }
                }
                let issue = IssueClass(issueID: Int(i.id)!,
                                       title: (i.title!),
                                       description: i.description,
                                       location: i.location ?? "",
                                       issueImage: i.image ?? "",
                                       user_id: (i.userId!),
                                       likes: (i.likes!),
                                       favorites: (i.favorites!),
                                       dateNtime: (i.createdAt!),
                                       comments: listOfComments,
                                       userName: i.user.name!,
                                       userImage: i.user.picture ?? "",
                                       type: i.type!)
                DispatchQueue.main.async {
                    completionHandler(issue)
                }
            }
        }
    }

    
    func getUserById(id: Int, completionHandler: @escaping (UserClass) -> ()) {
        self.apollo.fetch(query: UserByIdQuery(id: id)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let u = result?.data?.userById {
                DispatchQueue.main.async {
                    completionHandler(UserClass(id: Int(u.id)!, name: (u.name!), netid: u.netid, image: u.picture!, phone: u.phone!))
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
    
    func createComment(comment:String, image:String, issueId:Int, userId:Int){
        apollo.perform(mutation: CreateCommentMutation(body: comment, image: image, userId: userId, issueId: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func createUser(name: String, netid: String, phone: String, picture: String, completionHandler: @escaping (Int) -> ()){
        apollo.perform(mutation: CreateUserMutation(name: name, netid: netid, phone: phone, picture: picture))  { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            DispatchQueue.main.async {
                completionHandler(Int((result?.data?.createUser.id)!)!)
            }
        }
    }

    func addLike(issueId: Int) {
        apollo.perform(mutation: AddLikeToIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func deleteLike(issueId: Int) {
        apollo.perform(mutation: DeleteLikeFromIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func addFavorite(issueId: Int) {
        apollo.perform(mutation: AddFavoriteToIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func deleteFavorite(issueId: Int) {
        apollo.perform(mutation: DeleteFavoriteFromIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }

}
