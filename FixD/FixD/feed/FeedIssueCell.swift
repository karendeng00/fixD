//
//  FeedIssueCell.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class FeedIssueCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var issueName: UILabel!
    @IBOutlet weak var issueDescription: UILabel!
    @IBOutlet weak var issueLocation: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var issueDate: UILabel!

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var issueUpvotes: UILabel!
    @IBOutlet weak var issueFavorites: UILabel!
    
    @IBAction func upVote(_ sender: Any) {
        let currCount = issueUpvotes.text!
        let newCount = (Int(currCount) ?? 0) + 1
        issueUpvotes.text = String(newCount)
    }
    
    @IBAction func favorite(_ sender: Any) {
        let currCount = issueFavorites.text!
        let newCount = (Int(currCount) ?? 0) + 1
        issueFavorites.text = String(newCount)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

