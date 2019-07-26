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
    
    // This method fetches information from IDMS to populate user. If the user already exists
    // in the system, then the user is loaded. Otherwise, a new user is created with the
    // information loaded from IDMS. The method instantiantes a singleton UserAccount.
    func getUserDuid(nav: UINavigationController, completionHandler: @escaping (_ duid: String?, _ error: String?) -> Void) {
        Apollo().getClient().fetch(query: GetDuidQuery(), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                switch (err.response.statusCode) {
                    case 401:
                        // The request was unauthorized due to a bad token, request a new OAuth token.
                        OAuthService.shared.refreshToken(navController: nav) { success, statusCode in
                            if success {
                                // We receieved a new token, try again.
                                self.getUserDuid(nav: nav) { duid, error in
                                    completionHandler(duid, error)
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
                                self.getUserDuid(nav: nav) { duid, error in
                                    completionHandler(duid, error)
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
                print((result?.data?.getDuid)!)
                DispatchQueue.main.async{
                    completionHandler((result?.data?.getDuid)!, nil)
                }
        }
        }
    }
    
//    //This method checks for e
//    func fetchUserData(nav: UINavigationController, completionHandler: @escaping ([String]) -> Void){
//        getUserDuid(nav: nav) { duid in
//        // Get the User info (comes back as a String array).
//            self.apollo.fetch(query: GetUserInfoQuery(duid: duid)) { (result, error) in
//                if let err = error as? GraphQLHTTPResponseError {
//                    print(err.response.statusCode)
//                }
//                DispatchQueue.main.async{
//                    completionHandler((result?.data?.getUserInfo)!) // catch errors
//                }
//            }
//        }
//    }
//
//    func setUpUser(nav: UINavigationController) {
//        let user = UserAccount.account
//        fetchUserData(nav: nav) { info in
//            // Use netID to check if user exists
//            self.apollo.fetch(query: UserByNetIdQuery(netid: info[0])) { (result, error) in
//                if let err = error as? GraphQLHTTPResponseError {
//                    print (err.response.statusCode)
//                }
//                // If user exists, instantiate User with info
//                if let u = result?.data?.userByNetId {
//                    user.setUp(id: Int(u.id)!, duid: info[1], netid: u.netid, name: u.name!, phone: u.phone ?? "", picture: u.picture ?? "")
//                }
//                // If user does not exist, create a new User and instantiate
//                else {
//                    user.newUser(duid:info[1], netid: info[0], name: info[2] , phone: "", picture: "")
//                }
//            }
//        }
//    }
//
    func getListOfIssues(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        var myIssueList: Array<IssueClass> = []
        Apollo().getClient().fetch(query: AllIssuesQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let issues = result?.data?.allIssues {
                for issue in issues {
                    var listOfComments:[CommentsClass] = []
                    if let comments = issue.comments {
                        for comment in comments {
                            listOfComments.append(CommentsClass(body: comment.body ?? "", image: comment.image!, userId: comment.userId, issueId: comment.issueId, name: issue.user.name!, user_image: issue.user.picture ?? ""))
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
        Apollo().getClient().fetch(query: IssueByIdQuery(id: Int(id))) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            if let i = result?.data?.issueById {
                var listOfComments:[CommentsClass] = []
                if let comments = i.comments {
                    for comment in comments {
                        listOfComments.append(CommentsClass(body: comment.body ?? "", image: comment.image!, userId: comment.userId, issueId: comment.issueId, name: i.user.name!, user_image: i.user.picture ?? ""))
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
        Apollo().getClient().fetch(query: UserByIdQuery(id: id)) { (result, error) in
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
        Apollo().getClient().perform(mutation: CreateIssueMutation(description: issue.getDescription(), image: issue.getIssueImage(), location: issue.getLocation(), userId: 1, title: issue.getTitle(), type: issue.getType(), likes: 0, favorites: 0, email: issue.getEmail(), phone: issue.getPhone(), alternatePhone: issue.getAltPhone(), group: "", urgency: issue.getUrgency(), sensitiveInfo: issue.getSensitiveInfo(), campus: issue.getCampus(), area: issue.getArea(), specificLocation: issue.getSpecificLocation(), roomNumber: issue.getRoom(), serviceAnimal: issue.getAnimal(), impact: issue.getImpact(), yourBuilding: issue.getBuildingFacilities(), yourFloor: issue.getFloorFacilities(), yourRoom: issue.getRoomFacilities(), requestType: issue.getRequestFor(), issueBuilding: issue.getBuildingService(), issueFloor: issue.getFloorService(), issueRoom: issue.getRoomService(), serviceType: issue.getServiceType(), fundCode: issue.getFundCode(), topic: "", name: issue.getName())) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print("Error: ", err.response.statusCode)
            }
            else {
                print("success")
            }
        }
    }
    
    func createComment(comment:String, image:String, issueId:Int, userId:Int){
        Apollo().getClient().perform(mutation: CreateCommentMutation(body: comment, image: image, userId: userId, issueId: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func createUser(name: String, netid: String, phone: String, picture: String, completionHandler: @escaping (Int) -> ()){
        Apollo().getClient().perform(mutation: CreateUserMutation(name: name, netid: netid, phone: phone, picture: picture))  { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            DispatchQueue.main.async {
                completionHandler(Int((result?.data?.createUser.id)!)!)
            }
        }
    }

    func addLike(issueId: Int) {
        Apollo().getClient().perform(mutation: AddLikeToIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func deleteLike(issueId: Int) {
        Apollo().getClient().perform(mutation: DeleteLikeFromIssueMutation(id:issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func addFavorite(issueId: Int) {
        Apollo().getClient().perform(mutation: AddFavoriteToIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func deleteFavorite(issueId: Int) {
        Apollo().getClient().perform(mutation: DeleteFavoriteFromIssueMutation(id: issueId)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func deleteIssue(issueID: Int) {
        Apollo().getClient().perform(mutation: DeleteIssueMutation(id: issueID)) {(result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
        }
    }
    
    func uploadCommentImage(issueID: Int, userID: Int, commentImage: UIImage) {
        
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
        data.append("This is the body".data(using: .utf8)!)
        
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
        data.append("\(userID)".data(using: .utf8)!)
        
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
            
        }).resume()
    }

}
