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
    
    var userCommentDictionary = ["This is awesome" : "Pren"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCommentDictionary["I hate this"] = "Ken"
        commentView.delegate = self
        commentView.dataSource = self
        commentView.numberOfRows(inSection: 1)
        issueLabel.text = "Broken Toilet"
        dateLabel.text = "3/14/19"
        descriptionLabel.text = "The 3rd toilet in the third floor's bathroom is overflowing."
        profileImage.image = UIImage(named: "photo1.png")
        locationLabel.text = "420 Chapel Drive, Durham, NC"
        issueImage.image = UIImage(named: "printer.jpg")
    }
    
    func loadIssue(issue: IssueClass) {
        dateLabel.text = issue.date
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCommentCell", for: indexPath) as! textCommentCell
        cell.commentLabel.text = "This is aghhhgwesome"
        cell.userLabel.text = "-Friend"
        return cell
    }
}
