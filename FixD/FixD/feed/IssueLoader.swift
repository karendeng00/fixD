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

    private let myURL:String = "http://localhost:3000/json"
    private var myIssueDictionary: [Int: IssueClass] = [:]
    
    let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)

    
    
    func getData(completionHandler: @escaping (Dictionary<Int, IssueClass>) -> ()) {
        
        let allIssues = AllIssuesQuery()
        apollo.fetch(query: allIssues) { (result, error) in
            if let err = error as? GraphQLHTTPResponseError {
                print(err.response.statusCode)
            }
            let issues = result?.data?.allIssues
            for issue in issues! {
                let i = IssueClass(
                    issueID: issue.id,
                    title: issue.title!,
                    description: issue.description!,
                    location: issue.location!,
                    issueImage: issue.image!,
                    user_id: issue.userId!,
                    upVotes: 000,
                    favorites: 000)
                let index = Int(i.getID())!
                self.myIssueDictionary[index] = i
            }
            //anonymous function call
            DispatchQueue.main.async {
                completionHandler(self.myIssueDictionary)
            }
        }
    }
}
