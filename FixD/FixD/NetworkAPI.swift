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
    
    let myUser = UserAccount.shared
    
    func setUpUser(nav: UINavigationController, completionHandler: @escaping (_ user: Bool) -> Void){
        let user = UserAccount.shared
         // Get the User info (comes back as a String array).
        Apollo().getClient().fetch(query: GetUserInfoQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.setUpUser(nav: nav){ results in
                                completionHandler(results)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.setUpUser(nav: nav) { results in
                                completionHandler(results)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                if let u = result?.data?.getUserInfo {
                    user.setUp(id: Int(u.id)!, duid: "", netid: u.netid, name: u.name!, phone: u.phone ?? "", picture: u.picture ?? "", myLikes: [], myFavorites: [])
                    completionHandler(true)
                }
                print("USER LOADED")
            }
        }
    }

    func getListOfIssues(nav: UINavigationController, completionHandler: @escaping (_ list: Array<IssueClass>, _ error: String?) -> Void) {
        var myIssueList: Array<IssueClass> = []
        Apollo().getClient().fetch(query: AllIssuesQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.getListOfIssues(nav: nav) { list, error in
                                completionHandler(list, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.getListOfIssues(nav: nav) { list, error in
                                completionHandler(list, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                if let issues = result?.data?.allIssues {
                    for issue in issues {
                        var listOfComments:[CommentsClass] = []
                        if let comments = issue.comments {
                            for comment in comments {
                                listOfComments.append(CommentsClass(body: comment.body ?? "", image: UIImage(), userId: comment.userId, issueId: comment.issueId, name: comment.user.name!, user_image: comment.user.picture ?? ""))
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
                        completionHandler(myIssueList, nil)
                    }
                }
            }
        }
    }
    
    func getIssueById(nav: UINavigationController, id: Int, completionHandler: @escaping (_ issue: IssueClass, _ error: String?) -> Void) {
        Apollo().getClient().fetch(query: IssueByIdQuery(id: Int(id))) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.getIssueById(nav: nav, id: Int(id)) { issue, error in
                                completionHandler(issue, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.getIssueById(nav: nav, id: Int(id)) { issue, error in
                                completionHandler(issue, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                if let i = result?.data?.issueById {
                    var listOfComments:[CommentsClass] = []
                    if let comments = i.comments {
                        for comment in comments {
                            listOfComments.append(CommentsClass(body: comment.body ?? "", image: UIImage(), userId: comment.userId, issueId: comment.issueId, name: comment.user.name!, user_image: comment.user.picture ?? ""))
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
                        completionHandler(issue, nil)
                    }
                }
            }
        }
    }

    
    func buildIssue(issue: IssueClass, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: CreateIssueMutation(description: issue.getDescription(), image: issue.getIssueImage(), location: issue.getLocation(), userId: myUser.getUserId() , title: issue.getTitle(), type: issue.getType(), likes: 0, favorites: 0, email: issue.getEmail(), phone: issue.getPhone(), alternatePhone: issue.getAltPhone(), group: "", urgency: issue.getUrgency(), sensitiveInfo: issue.getSensitiveInfo(), campus: issue.getCampus(), area: issue.getArea(), specificLocation: issue.getSpecificLocation(), roomNumber: issue.getRoom(), serviceAnimal: issue.getAnimal(), impact: issue.getImpact(), yourBuilding: issue.getBuildingFacilities(), yourFloor: issue.getFloorFacilities(), yourRoom: issue.getRoomFacilities(), requestType: issue.getRequestFor(), issueBuilding: issue.getBuildingService(), issueFloor: issue.getFloorService(), issueRoom: issue.getRoomService(), serviceType: issue.getServiceType(), fundCode: issue.getFundCode(), topic: "", name: issue.getName())) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.buildIssue(issue: issue, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.buildIssue(issue: issue, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                print("Issue Submitted Successfully!")
            }
        }
    }
    
    func createComment(comment:String, image:String, issueId:Int, userId:Int, nav: UINavigationController){
        Apollo().getClient().perform(mutation: CreateCommentMutation(body: comment, image: image, userId: userId, issueId: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.createComment(comment: comment, image: image, issueId: issueId, userId: userId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.createComment(comment: comment, image: image, issueId: issueId, userId: userId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                print("Comment Added Succesfully!")
            }
        }
    }
    
    func createUser(nav: UINavigationController, name: String, netid: String, phone: String, picture: String, completionHandler: @escaping (_ id: Int, _ error: String?) -> Void){
        Apollo().getClient().perform(mutation: CreateUserMutation(name: name, netid: netid, phone: phone, picture: picture))  { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.createUser(nav: nav, name: name, netid: netid, phone: phone, picture: picture) { id, error in
                                    completionHandler(id, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.createUser(nav: nav, name: name, netid: netid, phone: phone, picture: picture) { id, error in
                                completionHandler(id, error)
                            }
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
            else {
                DispatchQueue.main.async {
                    completionHandler(Int((result?.data?.createUser.id)!)!, nil)
                }
            }
        }
    }

    func addLike(issueId: Int) {
        Apollo().getClient().perform(mutation: AddLikeToIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("--------------------------------")
                print("Network Error: ")
                print(err.response.statusCode)
                print("--------------------------------")
            }
        }
    }
    
    func deleteLike(issueId: Int) {
        Apollo().getClient().perform(mutation: DeleteLikeFromIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("--------------------------------")
                print("Network Error: ")
                print(err.response.statusCode)
                print("--------------------------------")
            }
        }
    }
    
    func addFavorite(issueId: Int) {
        Apollo().getClient().perform(mutation: AddFavoriteToIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("--------------------------------")
                print("Network Error: ")
                print(err.response.statusCode)
                print("--------------------------------")
            }
        }
    }
    
    func deleteFavorite(issueId: Int) {
        Apollo().getClient().perform(mutation: DeleteFavoriteFromIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("--------------------------------")
                print("Network Error: ")
                print(err.response.statusCode)
                print("--------------------------------")
            }
        }
    }
    
    func deleteIssue(nav: UINavigationController, issueId: Int) {
        Apollo().getClient().perform(mutation: DeleteIssueMutation(id: issueId)) {(result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteIssue(nav: nav, issueId: issueId)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteIssue(nav: nav, issueId: issueId)
                        } else {
                            // TODO: handle error
                        }
                    }
                }
            }
            else if let err = error as NSError?, err.domain == NSURLErrorDomain {
                print("error NSE")
                // TODO: Handle error
                // let title = "Unexpected Error"
                // let message = err.localizedDescription
                // self.showMessage(message: ["title": title, "message": message])
            }
        }
    }

}
