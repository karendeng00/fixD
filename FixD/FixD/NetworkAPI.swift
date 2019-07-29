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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
                    user.setUp(id: Int(u.id)!, duid: "", netid: u.netid, name: u.name!, phone: u.phone ?? "", picture: u.picture ?? "", myLikes: u.likedIssues!, myFavorites: u.favoritedIssues!)
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
                                listOfComments.append(CommentsClass(body: comment.body ?? "", image: comment.image!, userId: comment.userId, issueId: comment.issueId, name: comment.user.name!, user_image: comment.user.picture ?? ""))
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
                            listOfComments.append(CommentsClass(body: comment.body ?? "", image: comment.image!, userId: comment.userId, issueId: comment.issueId, name: comment.user.name!, user_image: comment.user.picture ?? ""))
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
    
    func createComment(comment:String, image:String, issueId:Int, userId:Int, nav: UINavigationController) {
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
                print("it's been successful")
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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

    func addLike(issueId: Int, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: AddLikeToIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addLike(issueId: issueId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addLike(issueId: issueId, nav: nav)
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
                print("Like Added Succesfully!")
            }
        }
    }
    
    func deleteLike(issueId: Int, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: DeleteLikeFromIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteLike(issueId: issueId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteLike(issueId: issueId, nav: nav)
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
                print("Like Deleted Succesfully!")
            }
        }
    }
    
    func addFavorite(issueId: Int, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: AddFavoriteToIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addFavorite(issueId: issueId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addFavorite(issueId: issueId, nav: nav)
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
                print("Favorite Added Succesfully!")
            }
        }
    }
    
    func deleteFavorite(issueId: Int, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: DeleteFavoriteFromIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteFavorite(issueId: issueId, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteFavorite(issueId: issueId, nav: nav)
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
                print("Favorite Deleted Succesfully!")
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
//                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
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
    
    func uploadCommentImage(issueID: Int, userID: Int, commentImage: UIImage, completionHandler: @escaping (Bool) -> ()) {
        
        let image = commentImage
        let filename = "avatar.png"
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: URL(string: "http://localhost:3000/comments")!)
        urlRequest.httpMethod = "POST"
        
        print("printed request")
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the reqtype field and its value to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[body]\"\r\n\r\n".data(using: .utf8)!)
        data.append("".data(using: .utf8)!)
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[avatar]\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[issue_id]\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(issueID)".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[user_id]\"\r\n\r\n".data(using: .utf8)!)
        data.append("1".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"commit\"\r\n\r\n".data(using: .utf8)!)
        data.append("Save Comment".data(using: .utf8)!)
        
        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                print("\(error!.localizedDescription)")
            }
            
            guard let responseData = responseData else {
                print("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                print("uploaded to: \(responseString)")
            }
            
            DispatchQueue.main.async {
                completionHandler(true)
            }
            
        }).resume()
    }

    func addLikeToUser(userID: Int!, issueID: Int!, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: AddLikeToUserMutation(userId: userID, issueId: issueID)) { result, error in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addLikeToUser(userID: userID, issueID: issueID, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    //                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addLikeToUser(userID: userID, issueID: issueID, nav: nav)
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
    
    func addFavToUser(userID: Int!, issueID: Int!, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: AddFavToUserMutation(userId: userID, issueId: issueID)){ results, error in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addFavToUser(userID: userID, issueID: issueID, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    //                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.addFavToUser(userID: userID, issueID: issueID, nav: nav)
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
    
    func deleteLikeFromUser(userID: Int!, issueID: Int!, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: DeleteLikeFromUserMutation(userId: userID, issueId: issueID)){ results, error in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteLikeFromUser(userID: userID, issueID: issueID, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    //                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteLikeFromUser(userID: userID, issueID: issueID, nav: nav)
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
    
    func deleteFavFromUser(userID: Int!, issueID: Int!, nav: UINavigationController) {
        Apollo().getClient().perform(mutation: DeleteFavFromUserMutation(userId: userID, issueId: issueID)){ results, error in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                case 401:
                    // The request was unauthorized due to a bad token, request a new OAuth token.
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteFavFromUser(userID: userID, issueID: issueID, nav: nav)
                        } else {
                            // TODO: handle error
                        }
                    }
                case 403:
                    print("403")
                    // TODO: Handle not authorized (Forbidden) error
                    //                    let message = ["title": "Unauthorized", "message": "You do not have access to this feature."]
                // self.showMessage(message: message)
                case 500...599:
                    print("500")
                // TODO: handle GQL/Kong server error
                default:
                    // Something else went wrong, get a new token and try again
                    OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                        if success {
                            self.deleteFavFromUser(userID: userID, issueID: issueID, nav: nav)
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
