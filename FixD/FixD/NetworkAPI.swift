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

    let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)

    func getListOfIssues(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        var myIssueList: Array<IssueClass> = []
        apollo.fetch(query: AllIssuesQuery()) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            let issues = result?.data?.allIssues
            for issue in issues! {
                myIssueList.append(IssueClass(
                    issueID: issue.id,
                    title: issue.title!,
                    description: issue.description,
                    location: issue.location!,
                    issueImage: issue.image!,
                    user_id: issue.userId!,
                    likes: issue.likes!,
                    favorites: issue.favorites!))
            }
            DispatchQueue.main.async {
                completionHandler(myIssueList)
            }
        }
    }
    
    func getIssueById(id: Int, completionHandler: @escaping (IssueClass) -> ()) {
        apollo.fetch(query: IssueByIdQuery(id: Int(id))) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            let i = result?.data?.issueById
            let issue = IssueClass(issueID: i!.id,
                                   title: (i?.title!)!,
                                   description: i?.description ?? "",
                                   location: i?.location ?? "",
                                   issueImage: i?.image ?? "",
                                   user_id: (i?.userId!)!,
                                   likes: (i?.likes!)!,
                                   favorites: (i?.favorites!)!)
            DispatchQueue.main.async {
                completionHandler(issue)
            }
        }
    
    }
    
    func getListOfComments(id: Int, completionHandler: @escaping (Array<String>) -> ()) {
        var list:Array<String> = []
        self.apollo.fetch(query: CommentsByIssueQuery(issueId: id)) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            let result = result?.data?.commentsByIssue
            for comment in result! {
                list.append(comment.body)
            }
            DispatchQueue.main.async {
                completionHandler(list)
            }
        }

    }
}
