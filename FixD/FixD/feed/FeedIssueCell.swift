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
    
    
    override func layoutSubviews() {
        
        
        super.layoutSubviews()
        
        print("this loaded")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tap1)
    
    }
    
    private var issueID = 0
    private var myIssues: [IssueClass] = Array()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        getIssueData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*override func layoutSubviews() {
        // Set the width of the cell
        self.bounds = CGRect(origin: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y), size: CGSize(width: self.bounds.size.width - 40, height: self.bounds.size.height))
        super.layoutSubviews()
    }*/
    
    func setIssueID(ID: Int){
        issueID = ID
    }

    @objc func like(_ sender: Any) {
        for issue in myIssues {
            if issue.getID() == issueID {
                issue.addUpVote()
                issueUpvotes.text = String(issue.getUpVotes())
                if (issue.getUpVoteState()){
                    upVoteButton.setImage(UIImage(named: "heart-1.png"), for: .normal)
                }else {
                    upVoteButton.setImage(UIImage(named: "filled heart.png"), for: .normal)
                }
            }
        }
    }

    @IBAction func upVote(_ sender: Any) {
        for issue in myIssues {
            if issue.getID() == issueID {
                issue.addUpVote()
                issueUpvotes.text = String(issue.getUpVotes())
                if (issue.getUpVoteState()){
                    upVoteButton.setImage(UIImage(named: "heart-1.png"), for: .normal)
                }else {
                    upVoteButton.setImage(UIImage(named: "filled heart.png"), for: .normal)
                }
            }
        }
       
    }
    
    @IBAction func favorite(_ sender: Any) {
        for issue in myIssues {
            if issue.getID() == issueID {
                issue.addFavorites()
                issueFavorites.text = String(issue.getFavorites())
                if (issue.getFavoritesState()){
                    favoritesButton.setImage(UIImage(named: "filled star"), for: .normal)
                }else {
                    favoritesButton.setImage(UIImage(named: "star"), for: .normal)
                }
            }
        }
    }

    private func getIssueData() {
        IssueBuilder().getData() { issueData in
            self.myIssues = issueData
        }
    }
    
}

