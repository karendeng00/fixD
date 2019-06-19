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
    
    
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!
    
    private var issueID = 0
    private var myIssues = IssueBuilder().myPosts
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setIssueID(ID: Int){
        issueID = ID
    }
    
    @IBAction func upVote(_ sender: Any) {
        myIssues[issueID].addUpVote()
        issueUpvotes.text = String(myIssues[issueID].getUpVotes())
        if (myIssues[issueID].getUpVoteState()){
            upVoteButton.setImage(UIImage(named: "fArrow.png"), for: .normal)
        }else {
            upVoteButton.setImage(UIImage(named: "eArrow.png"), for: .normal)
        }
    }
    
    @IBAction func favorite(_ sender: Any) {
        myIssues[issueID].addFavorites()
        issueFavorites.text = String(myIssues[issueID].getFavorites())
        if (myIssues[issueID].getFavoritesState()){
            favoritesButton.setImage(UIImage(named: "fPin"), for: .normal)
        }else {
            favoritesButton.setImage(UIImage(named: "ePin"), for: .normal)
        }
    }

}

