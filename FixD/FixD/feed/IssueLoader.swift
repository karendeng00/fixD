//
//  IssueLoader.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueLoader {

    private let myURL:String = "http://localhost:3000/json"
    private var myIssueDictionary: [Int: IssueClass] = [:]

    func getData(completionHandler: @escaping (Dictionary<Int, IssueClass>) -> ()) {
        let url = URL(string: myURL)!
    
        //url session
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                let issuesList = (json as! NSArray) as Array
                for issue in issuesList {
                    if let data = issue as? [String: Any] {
                        let i = IssueClass(
                            issueID: data["id"]! as! Int,
                                title:"\(data["title"]!)",
                                description: "\(data["description"]!)",
                                location: "\(data["location"]!)",
                                issueImage: "\(data["image"]!)",
                                user_id: data["user_id"]! as! Int,
                                upVotes: 000,
                                favorites: 000)
                        self.myIssueDictionary[i.getID()] = i
                    }
                }
                //anonymous function call
                DispatchQueue.main.async {
                    completionHandler(self.myIssueDictionary)
                }
            }
        }
        task.resume()
    }
}
