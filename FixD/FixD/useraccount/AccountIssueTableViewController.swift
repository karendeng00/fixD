//
//  AccountIssueTableViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AccountIssueTableViewController: UITableViewController, UISearchBarDelegate {

    let myCellIndentifier = "IssueCell"
    var myUserIssuesList:[IssueClass] = []
    var issuesReportedList:[IssueClass] = []
    var issuesStarredList:[IssueClass] = []
    var scopeList:[IssueClass] = []
    var listFlag = true
    let myUser = UserAccount.shared
    
//    @IBOutlet weak var issueSelector: UISegmentedControl!
    @IBOutlet weak var issueSearchAndScope: UISearchBar!
    
    var issuesList:[IssueClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        
        getIssueData()
        //list = myUserIssuesList
        
        issueSearchAndScope.scopeButtonTitles = ["Issues I've Favorited", "Issues I've Reported"]
        issueSearchAndScope.text = "Search issue by title"
        
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
        if searching {
            return accountSearchIssues.count
        } else {
            return scopeList.count
        }
//        return issuesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! FeedIssueCell
        
        //let obj = myUserIssuesList[indexPath.row]
        //let obj = issuesList[indexPath.row]
        if searching {
            let obj = accountSearchIssues[indexPath.row]

            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            //cell.issueUpvotes.text = String(obj.getUpVotes())
            //cell.issueFavorites.text = String(obj.getFavorites())
            cell.userName.text = obj.myUserName
    //        cell.userImage.image = UIImage(named: obj.myUserImage)
            cell.locationImage.image = UIImage(named:"locicon")
        } else {
            let obj = scopeList[indexPath.row]
            
            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            //cell.issueUpvotes.text = String(obj.getUpVotes())
            //cell.issueFavorites.text = String(obj.getFavorites())
            cell.userName.text = obj.myUserName
            //        cell.userImage.image = UIImage(named: obj.myUserImage)
            cell.locationImage.image = UIImage(named:"locicon")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePageFromAccount", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let indexPath = tableView.indexPathForSelectedRow{
                let currCell = tableView.cellForRow(at: indexPath) as! FeedIssueCell
                viewController?.issueID = currCell.myIssue.getID()
            }
        }
    }
    
    /**
    * Code to delete the cell a table view cell
    **/
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            NetworkAPI().deleteIssue(issueID: self.issuesList[indexPath.row].getID())
            self.issuesList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .bottom)
            completionHandler(true)
            
        }
        swipeAction.backgroundColor = .red
        swipeAction.image = UIImage(named: "delete")

        let configuration = UISwipeActionsConfiguration(actions: [swipeAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    @IBOutlet var accountFeed: UITableView!
    
    func getIssueData() {
        NetworkAPI().getListOfIssues() { issueData in
            self.resetLists()
            let issues:[IssueClass] = issueData
            for issue in issues {
                if issue.getUserId() == self.myUser.getUserId() && self.listFlag == true {
                    self.issuesReportedList.append(issue)
                    //self.issuesList = self.issuesReportedList
                    if self.searching {
                        self.accountSearchIssues = self.issuesReportedList
                    } else {
                        self.scopeList = self.issuesReportedList
                    }
                }
                if issue.getUserId() != self.myUser.getUserId() && self.listFlag == false {
                    self.issuesStarredList.append(issue)
                    //self.issuesList = self.issuesStarredList
                    //self.scopeList = self.issuesStarredList
                    if self.searching {
                        self.accountSearchIssues = self.issuesStarredList
                    } else {
                        self.scopeList = self.issuesStarredList
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
    
//    @IBAction func selectorChanged(_ sender: Any) {
//        switch issueSearchAndScope.selectedSegmentIndex {
//        case 0:
//            print("Issues I've Reported has been selected")
//            listFlag = true
//            self.getIssueData()
//        case 1:
//            print("Issues I've Starred has been selected.")
//            listFlag = false
//            self.getIssueData()
//        default:
//            break
//        }
//    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //filter
        searching = false
        tableView.reloadData()
        issueSearchAndScope.text = "Search issue by title"
        switch issueSearchAndScope.selectedScopeButtonIndex {
        case 0:
            print("Issues I've Reported has been selected")
            listFlag = true
            self.getIssueData()
            print(scopeList.count)
        case 1:
            print("Issues I've Starred has been selected.")
            listFlag = false
            self.getIssueData()
            print(scopeList.count)
        default:
            break
        }
    }
    
    private func resetLists() {
        self.issuesReportedList = Array()
        self.issuesStarredList = Array()
        self.issuesList = Array()
    }
    
    var accountIssueList = Set<IssueClass>()
    var accountSearchIssues = [IssueClass]()
    var searching = false
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        accountSearchIssues = scopeList.filter({( issue:IssueClass) -> Bool in
            return issue.getTitle().lowercased().contains(searchText.lowercased())
        })
        searching = true
        tableView.reloadData()
        for item in accountSearchIssues {
            print(item.getTitle())
        }
        
        if searchText == "" {
            searching = false
            tableView.reloadData()
        }
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        issueSearchAndScope.text = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        issueSearchAndScope.text = "Search issue by title"
        searching = false
        tableView.reloadData()
        issueSearchAndScope.resignFirstResponder()
    }
    
}
