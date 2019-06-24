//
//  IssuePageController.swift
//  FixD
//
//  Created by Duc Tran on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class textCommentCell: UITableViewCell{
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class IssuePageController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentView: UITableView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    
    var comments:[String] = []
    var issueID:Int = 0
    var issue:IssueClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentView.delegate = self
        commentView.dataSource = self
        issue.addComment(comment: "This printer has been broken for years now.")
        issue.addComment(comment: "This printer prints as fast as my grandmother runs...Slowly!")
        issue.addComment(comment: "What a waste of space this printer is.")
        comments = issue.getListOfComments()
        loadIssue()
    }
    
    func loadIssue() {
        issueLabel.text = issue.getTitle()
        dateLabel.text = issue.getDate()
        descriptionLabel.text = issue.getDescription()
        issueImage.image = UIImage(named: issue.getIssueImage())
        locationLabel.text = issue.getLocation()
        profileImage.image = UIImage(named: issue.getUser().userImage)
        favoritesLabel.text = String(issue.getFavorites())
        upvotesLabel.text = String(issue.getUpVotes())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCommentCell", for: indexPath) as! textCommentCell
        cell.commentLabel.text = comments[indexPath.row]
        cell.userLabel.text = "-Anderson C."
        return cell
    }
}
