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
        var issue1 = IssueClass(title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "Crowell Quad, apt DD111", date: "06/06/19", issueImage: "window", userName: "Jimmy Jim Jim", userImage: "photo.jpg")
    
        
        
    }
    
    
    func buildIssues() {
        self.myPosts = [IssueClass(title: "Broken Window in my Dorm", description: "I broke my window playing baseball", location: "Crowell Quad, apt DD111", date: "06/06/19", issueImage: "window", userName: "Jimmy Jim Jim", userImage: "photo.jpg"),
                       IssueClass(title: "Broken Printer", description: "Printer in the Link wont work", location: "The Link, Perkins", date: "05/08/19", issueImage: "printer.jpg", userName: "Johnny John John", userImage: "photo1.png")]
    }
    
    func getPosts() -> [IssueClass] {
        return myPosts
    }
    
    
}
