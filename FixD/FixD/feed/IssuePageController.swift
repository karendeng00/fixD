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
    
    
    @IBOutlet var views: [UIView]!
    
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
    
    let white = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255/255.0, alpha: 1.0)
    let granite = UIColor(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextField.delegate = self
        commentView.delegate = self
        commentView.dataSource = self
        loadIssue()
        
        for v in views {
            v.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
            v.layer.masksToBounds = false
            v.layer.cornerRadius = 2.0
            v.layer.shadowOffset = CGSize(width: -1.5, height: 1.5)
            v.layer.shadowOpacity = 0.22
        }
        
        issueImage.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
        issueImage.layer.masksToBounds = false
        issueImage.layer.cornerRadius = 2.0
        issueImage.layer.shadowOffset = CGSize(width: -1, height: 1)
        issueImage.layer.shadowOpacity = 0.2
        

        let longLike = UILongPressGestureRecognizer(target: self, action: #selector(longL(_:)))
        longLike.minimumPressDuration = 0
        likeView.addGestureRecognizer(longLike)
        
        let longFav = UILongPressGestureRecognizer(target: self, action: #selector(longF(_:)))
        longFav.minimumPressDuration = 0
        favView.addGestureRecognizer(longFav)
        
        let longCom = UILongPressGestureRecognizer(target: self, action: #selector(longC(_:)))
        longCom.minimumPressDuration = 0
        comView.addGestureRecognizer(longCom)
        
    }
    
    @objc func longL(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .ended {
            commentView.backgroundColor = white
            commentView.layer.shadowOffset = CGSize(width: -1, height: 1)
            issue.addUpVote()
            
            if (issue.getUpVoteState()){
                likeButton.setImage(UIImage(named: "filled heart"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "heart-1"), for: .normal)
            }
        }
        else {
            
            likeView.backgroundColor = granite
            likeView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
    @objc func longF(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .ended {
            favView.backgroundColor = white
            favView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            issue.addFavorites()
            if (issue.getFavoritesState()){
                favButton.setImage(UIImage(named: "filled star"), for: .normal)
            }else {
                favButton.setImage(UIImage(named: "star"), for: .normal)
            }
        }
        else {
            favView.backgroundColor = granite
            favView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
    
    @objc func longC(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .ended {
            comView.backgroundColor = white
            comView.layer.shadowOffset = CGSize(width: -1, height: 1)
        }
        else {
            comView.backgroundColor = granite
            comView.layer.shadowOffset = CGSize(width: -10, height: 10)
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
        cell.userLabel.text = "-Name"
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
