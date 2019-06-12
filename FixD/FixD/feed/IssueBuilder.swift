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
        myPosts.append(IssueClass(title: "Broken Printer", description: "Printer in the Link wont work", location: "401 Chapel Dr, Durham, NC 27708", date: "05/08/19", issueImage: "printer.jpg", user: UserProfile(name: "Johnny John John", image: "photo1.png")))
    
        myPosts.append(IssueClass(title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "315 Towerview Drive, Durham, NC 27708", date: "06/06/19", issueImage: "window", user: UserProfile(name:"Jimmy Jim Jim", image: "photo.jpg")))
        
        myPosts.append(IssueClass(title: "Water fountain is leaking", description: "water fountain is broken near the west union south entrance", location:"416 Chapel Dr, Durham, NC 27708", date: "06/08/2019", issueImage: "window", user: UserProfile(name: "Jimmy Jim Jim", image: "photo.jpg" )))
    }
    
    func appendIssue(issue:IssueClass) {
        myPosts.append(issue)
    }
    
    func getIssues() -> [IssueClass] {
        return myPosts
    }
    
}
