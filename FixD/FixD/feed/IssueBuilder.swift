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
        myPosts.append(IssueClass(ID: 1, title: "Broken Printer", description: "Printer in the Link wont work", location: "401 Chapel Dr, Durham, NC 27708", date: "05/08/19", issueImage: "printer.jpg", user: UserProfile(name: "Johnny John John", image: "photo1.png"), upVotes: 231, favorites: 1099))

        myPosts.append(IssueClass(ID: 2, title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "315 Towerview Drive, Durham, NC 27708", date: "06/06/19", issueImage: "window", user: UserProfile(name:"Jimmy Jim Jim", image: "photo.jpg"), upVotes: 980, favorites: 121))

        myPosts.append(IssueClass(ID: 3, title: "Water fountain is leaking", description: "water fountain is broken near the west union south entrance", location:"416 Chapel Dr, Durham, NC 27708", date: "06/08/2019", issueImage: "window", user: UserProfile(name: "Jimmy Jim Jim", image: "photo.jpg" ), upVotes: 673, favorites: 1234))
    }
    
    private func loadData() {
        let url = URL(string: "http://localhost:3000/json")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                let issuesList = (json as! Array<Any>)
                for issue in issuesList{
                    if var dictionary = issue as? [String: Any] {

                        DispatchQueue.main.async {
                            self.myPosts.append(IssueClass(
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
                                    favorites: 000))
                        }
                    }
                }
            }
        }
        task.resume()
        print(myPosts.count)
    }
    
    public func getIssues() -> [IssueClass] {
        return myPosts
    }
    
}
