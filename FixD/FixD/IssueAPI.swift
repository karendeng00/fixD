//
//  IssueAPI.swift
//  FixD
//
//  Created by Karen Deng on 6/7/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation

class IssueAPI {

    var myPosts:[IssueClass]
    
    init() {
        let issue1 = IssueClass(title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "Crowell Quad, apt DD111", date: "06/06/19", issueImage: "window", userName: "Jimmy Jim Jim", userImage: "photo.jpg")
        
        let issue2 = IssueClass(title: "Broken Printer", description: "Printer in the Link wont work", location: "The Link, Perkins", date: "05/08/19", issueImage: "printer.jpg", userName: "Johnny John John", userImage: "photo1.png")
    
        myPosts = [IssueClass]()
        myPosts.append(issue1)
        myPosts.append(issue2)
        
    }
    
    func appendIssue(issue:IssueClass) {
        myPosts.append(issue)
    }
    
    func getIssues() -> [IssueClass] {
        return myPosts
    }
    
}
