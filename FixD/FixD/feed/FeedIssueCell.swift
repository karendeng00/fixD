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
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!

    var myIssue: IssueClass!

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        print("this loaded")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tap1)
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //getIssueData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setIssue(issue: IssueClass){
        myIssue = issue
    }

    @objc func like(_ sender: Any) {
        myIssue.addUpVote()
        issueUpvotes.text = String(myIssue.getUpVotes())
        if (myIssue.getUpVoteState()){
            upVoteButton.setImage(UIImage(named: "filled heart"), for: .normal)
        }else {
            upVoteButton.setImage(UIImage(named: "heart-1"), for: .normal)
        }
    }

    @IBAction func upVote(_ sender: Any) {
        myIssue.addUpVote()
        issueUpvotes.text = String(myIssue.getUpVotes())
        if (myIssue.getUpVoteState()){
            upVoteButton.setImage(UIImage(named: "fArrow.png"), for: .normal)
        }else {
            upVoteButton.setImage(UIImage(named: "eArrow.png"), for: .normal)
        }
    }
    
    @IBAction func favorite(_ sender: Any) {
        myIssue.addFavorites()
        issueFavorites.text = String(myIssue.getFavorites())
        if (myIssue.getFavoritesState()){
            favoritesButton.setImage(UIImage(named: "filled star"), for: .normal)
        }else {
            favoritesButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
}

