//
//  AccountIssueTableViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AccountIssueTableViewController: UITableViewController {

    let myCellIndentifier = "IssueCell"
    var myUserIssuesList:[IssueClass] = []
    
    let THIS_USER = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        
        getIssueData()
    }

    @objc func refresh(_ sender: Any) {
        getIssueData()
        self.refreshControl!.endRefreshing()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myUserIssuesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! FeedIssueCell
        
        
        let obj = myUserIssuesList[indexPath.row]
        
        cell.setIssue(issue: obj)
        cell.issueName.text = obj.getTitle()
        cell.issueDescription.text = obj.getDescription()
        cell.issueLocation.text = obj.getLocation()
        cell.issueImage.image = UIImage(named: obj.getIssueImage())
        cell.issueUpvotes.text = String(obj.getUpVotes())
        cell.issueFavorites.text = String(obj.getFavorites())
//        cell.userName.text = obj.getUser().userName
//        cell.userImage.image = UIImage(named:obj.getUser().userImage)
        cell.locationImage.image = UIImage(named:"locicon")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePageFromAccount", sender: (Any).self)
    }
    
    
    @IBOutlet var accountFeed: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let currCell = self.tableView.cellForRow(at: indexPath) as! FeedIssueCell
                viewController?.myIssue = currCell.myIssue
            }
        }
    }
    
    func getIssueData() {
        NetworkAPI().getListOfIssues() { issueData in
            self.myUserIssuesList = Array()
            let issues:[IssueClass] = issueData
            for issue in issues {
                if (issue.getUserId() == self.THIS_USER) {
                    self.myUserIssuesList.append(issue)
                }
            }
            self.tableView.reloadData()
        }
    }
}
