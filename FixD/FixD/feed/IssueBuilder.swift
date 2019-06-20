//
//  IssueAPI.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueBuilder {

    private var myPosts: Array<IssueClass> = Array()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        let url = URL(string: "http://localhost:3000/json")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                let issuesList = (json as! NSArray) as Array
                for issue in issuesList {
                    if let dictionary = issue as? [String: Any] {
                        let i = IssueClass(
                                ID: dictionary["id"]! as! Int,
                                title:"\(dictionary["title"]!)",
                                description: "\(dictionary["description"]!)",
                                location: "\(dictionary["location"]!)",
                                date: "\(dictionary["date"]!)",
                                issueImage: "\(dictionary["image"]!)",
                                user: UserProfile(
                                name: "\(dictionary["user"]!)",
                                image: "\(dictionary["user_image"]!)"),
                                upVotes: 000,
                                favorites: 000)
                        self.myPosts.append(i)
                    }
                }
            }
        }
        task.resume()
    }
    
    public func getIssues() -> [IssueClass] {
        return myPosts
    }
    
//    DispatchQueue.main.async {
//    self.myPosts.append(IssueClass(
//    ID: dictionary["id"]! as! Int,
//    title:"\(dictionary["title"]!)",
//    description: "\(dictionary["description"]!)",
//    location: "\(dictionary["location"]!)",
//    date: "\(dictionary["date"]!)",
//    issueImage: "\(dictionary["image"]!)",
//    user: UserProfile(
//    name: "\(dictionary["user"]!)",
//    image: "\(dictionary["user_image"]!)"),
//    upVotes: 000,
//    favorites: 000))
//    }
//
}
