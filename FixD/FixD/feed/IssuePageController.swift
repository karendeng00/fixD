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

class IssuePageController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var comView: UIView!
    
    

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var comButton: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentView: UITableView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    var comments:[String] = []
    var issueID:Int = 0
    var issue:IssueClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextField.delegate = self
        commentView.delegate = self
        commentView.dataSource = self
        loadIssue()
        
        let tapLike = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tapLike)
        
        let tapFav = UITapGestureRecognizer(target: self, action: #selector(favorite(_:)))
        favView.addGestureRecognizer(tapFav)
    }
    
    
    @IBAction func liked(_ sender: Any) {
        issue.addUpVote()
        if (issue.getUpVoteState()){
            likeButton.setImage(UIImage(named: "filled heart"), for: .normal)
        }else {
            likeButton.setImage(UIImage(named: "heart-1"), for: .normal)
        }
    }
    
    
    @IBAction func favorited(_ sender: Any) {
        issue.addFavorites()
        if (issue.getFavoritesState()){
            favButton.setImage(UIImage(named: "filled star"), for: .normal)
        }else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    func loadIssue() {
        issueLabel.text = issue.getTitle()
        descriptionLabel.text = issue.getDescription()
        issueImage.image = UIImage(named: issue.getIssueImage())
        locationLabel.text = issue.getLocation()
        profileImage.image = UIImage(named: issue.getUser().userImage)
        comments = issue.getListOfComments()
        configureTapGesture()
    }
    
    
    
    @objc func like(_ sender: Any) {
        issue.addUpVote()
        if (issue.getUpVoteState()){
            likeButton.setImage(UIImage(named: "filled heart"), for: .normal)
        }else {
            likeButton.setImage(UIImage(named: "heart-1"), for: .normal)
        }
    }
    
    @objc func favorite(_ sender: Any) {
        issue.addFavorites()
        if (issue.getFavoritesState()){
            favButton.setImage(UIImage(named: "filled star"), for: .normal)
        }else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(IssuePageController.updateComments))
        view.addGestureRecognizer(tapGesture)
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
    
    @IBAction func updateComments(_ sender: Any) {
        if commentTextField.hasText{
            issue.addComment(comment: commentTextField.text!)
            commentTextField.text = ""
            comments = issue.getListOfComments()
            commentView.reloadData()
        }
        view.endEditing(true)
    }
    
    
    @IBAction func tapCommentButton(_ sender: Any) {
        view.endEditing(true)
    }
}
