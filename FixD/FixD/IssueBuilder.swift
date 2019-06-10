//
//  IssueAPI.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueBuilder {

    var myPosts: Array<IssueClass> = Array()
    
    init() {
        myPosts.append(IssueClass(title: "Broken Printer", description: "Printer in the Link wont work", location: "The Link, Perkins", date: "05/08/19", issueImage: "printer.jpg", user: UserProfile(name: "Johnny John John", image: "photo1.png")))
    
        myPosts.append(IssueClass(title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "Crowell Quad, apt DD111", date: "06/06/19", issueImage: "window", user: UserProfile(name:"Jimmy Jim Jim", image: "photo.jpg")))
        
        myPosts.append(IssueClass(title: "Water fountain is leaking", description: "water fountain is broken near the west union south entrance", location:"West Union Cafeteria", date: "06/08/2019", issueImage: "window", user: UserProfile(name: "Jimmy Jim Jim", image: "photo.jpg" )))
    }
    
    func appendIssue(issue:IssueClass) {
        myPosts.append(issue)
    }
    
    func getIssues() -> [IssueClass] {
        return myPosts
    }
    
}
