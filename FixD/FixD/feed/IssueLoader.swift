//
//  IssueLoader.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import Apollo

class IssueLoader {
    
    let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
    
    func getData(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        var myIssueList: Array<IssueClass> = []
        
        let allIssues = AllIssuesQuery()
        apollo.fetch(query: allIssues) { (result, error) in
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
}
