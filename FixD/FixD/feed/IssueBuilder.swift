//
//  IssueAPI.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueBuilder {

    private let myURL:String = "http://localhost:3000/json"
    private var myPosts: Array<IssueClass> = Array()
    
    func getData(completionHandler: @escaping (Array<IssueClass>) -> ()) {
        //url
        let url = URL(string: myURL)!
        
        //url session
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
                //anonymous function call
                DispatchQueue.main.async {
                    completionHandler(self.myPosts)
                }
                
                
            }
        }
        task.resume()
    }
}
