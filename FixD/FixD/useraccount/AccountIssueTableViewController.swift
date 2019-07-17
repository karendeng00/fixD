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
    var issuesReportedList:[IssueClass] = []
    var issuesStarredList:[IssueClass] = []
    var listFlag = true
    
    @IBOutlet weak var issueSelector: UISegmentedControl!
    
    let THIS_USER = 1
    
    var issuesList:[IssueClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        
        getIssueData()
        //list = myUserIssuesList
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
        return issuesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! FeedIssueCell
        
        //let obj = myUserIssuesList[indexPath.row]
        let obj = issuesList[indexPath.row]
        
        cell.setIssue(issue: obj)
        cell.issueName.text = obj.getTitle()
        cell.issueDescription.text = obj.getDescription()
        cell.issueLocation.text = obj.getLocation()
        cell.issueImage.image = UIImage(named: obj.getIssueImage())
        //cell.issueUpvotes.text = String(obj.getUpVotes())
        //cell.issueFavorites.text = String(obj.getFavorites())
        cell.userName.text = obj.myUserName
        cell.userImage.image = UIImage(named: obj.myUserImage)
        cell.locationImage.image = UIImage(named:"locicon")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePageFromAccount", sender: (Any).self)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
        }
        swipeAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [swipeAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //<#code#>
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
            self.resetLists()
            let issues:[IssueClass] = issueData
            for issue in issues {
                if issue.getUserId() == self.THIS_USER && self.listFlag == true {
                    self.issuesReportedList.append(issue)
                    self.issuesList = self.issuesReportedList
                }
                if issue.getUserId() != self.THIS_USER && self.listFlag == false {
                    self.issuesStarredList.append(issue)
                    self.issuesList = self.issuesStarredList
                }
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func selectorChanged(_ sender: Any) {
        switch issueSelector.selectedSegmentIndex {
        case 0:
            print("Issues I've Reported has been selected")
            listFlag = true
            self.getIssueData()
        case 1:
            print("Issues I've Starred has been selected.")
            listFlag = false
            self.getIssueData()
        default:
            break
        }
    }
    
    private func resetLists() {
        self.issuesReportedList = Array()
        self.issuesStarredList = Array()
        self.issuesList = Array()
    }
    
}
