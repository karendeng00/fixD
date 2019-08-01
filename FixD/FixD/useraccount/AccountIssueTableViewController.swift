//
//  AccountIssueTableViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//This class corresponds to the Issue Table View Controller within the User Account Page.
class AccountIssueTableViewController: UITableViewController, UISearchBarDelegate {

    let myCellIndentifier = "IssueCell"
    var issuesReportedList:[IssueClass] = []
    var issuesStarredList:[IssueClass] = []
    var scopeList:[IssueClass] = []
    var accountIssueList = Set<IssueClass>()
    var accountSearchIssues:[IssueClass] = []
    var searching = false
    var listFlag = true
    let myUser = UserAccount.shared
    
    @IBOutlet weak var issueSearchAndScope: UISearchBar!

    var issuesList:[IssueClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        
        getIssueData()
        
        issueSearchAndScope.scopeButtonTitles = ["Issues I've Reported", "Issues I've Starred"]
        issueSearchAndScope.text = "Search issue by title"
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += issueSearchAndScope.frame.size.height
        tableView.contentOffset = contentOffset
        
    }

    //Method used to refresh the table view by pulling from the database.
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
    
    //Used to identify if the user is searching (using the search) or not. The algorithm we used updates the list 
    //by editing the issue list depending on the search item.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return accountSearchIssues.count
        } else {
            return scopeList.count
        }
    }

    //This method sets up the cells of the table. Again, notice that the cells change depending on if the user
    //is searching or not.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! FeedIssueCell
        
        if searching {
            let obj = accountSearchIssues[indexPath.row]

            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            cell.userName.text = obj.myUserName
            cell.locationImage.image = UIImage(named:"locicon")
        } else {
            let obj = scopeList[indexPath.row]
            
            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            cell.userName.text = obj.myUserName
            cell.locationImage.image = UIImage(named:"locicon")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePageFromAccount", sender: (Any).self)
    }
    
    //This prepare segue is used to open issues when clicked on. When an issue is clicked, the IssuePage Controller
    //is opened with the information of that issue. Note that the issueID is passed on to the IssuePage Controller by reference, 
    //and there, a network call is made using the issueId to obtain user info. This allows for fresh data to show, and not old data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let indexPath = tableView.indexPathForSelectedRow{
                let currCell = tableView.cellForRow(at: indexPath) as! FeedIssueCell
                viewController?.issueID = currCell.myIssue.getID()
            }
        }
    }
    
    //This method is used to delete a issue from a tableview cell in case the user wants to delete it.
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "sbProfNav") as? UINavigationController
        let swipeAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            NetworkAPI().deleteIssue(nav:nav!, issueId: self.issuesList[indexPath.row].getID())
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
    
    //This method is used to get the user data from the network. 
    func getIssueData() {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "sbProfNav") as? UINavigationController
        resetLists()
        print("1:\(scopeList.count)")
        NetworkAPI().getListOfIssues(nav: nav!) { issueData,error in
            let issues = issueData
            for issue in issues {
                if self.listFlag {
                    if issue.getUserId() == self.myUser.getUserId() {
                        self.issuesReportedList.append(issue)
                        if self.searching {
                            self.accountSearchIssues = self.issuesReportedList
                        } else {
                            self.scopeList = self.issuesReportedList
                        }
                    }
                }
                else {
                    if(self.myUser.listOfFavedIssues.contains(issue.getID())){
                        self.issuesStarredList.append(issue)
                    }
                    if self.searching {
                        self.accountSearchIssues = self.issuesStarredList
                    } else {
                        self.scopeList = self.issuesStarredList
                    }
                }
                print("2:\(self.scopeList.count)")
                self.tableView.reloadData()
            }
        }
    }
    
    //This is the function used to activate the search bar as well as the dualbutton selector, to filter between issues reported and issues starred.
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //filter
        searching = false
        issueSearchAndScope.text = "Search issue by title"
        switch issueSearchAndScope.selectedScopeButtonIndex {
            case 0:
                listFlag = true
                self.getIssueData()
            case 1:
                listFlag = false
                self.getIssueData()
            default:
                break
        }
    }
    
    //This method resets all issue lists. 
    private func resetLists() {
        self.accountSearchIssues.removeAll()
        self.issuesReportedList.removeAll()
        self.issuesStarredList.removeAll()
        self.issuesList.removeAll()
        self.scopeList.removeAll()
    }
    
    //This is the code to search (using the search bar) within a list of issues. 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        accountSearchIssues = scopeList.filter({( issue:IssueClass) -> Bool in
            return issue.getTitle().lowercased().contains(searchText.lowercased())
        })
        searching = true
        tableView.reloadData()
        if searchText == "" {
            searching = false
            tableView.reloadData()
        }
    }
    
    //Code for if user began searching.
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        issueSearchAndScope.text = ""
    }
    
    //Code for if user canceled the search.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        issueSearchAndScope.text = "Search issue by title"
        searching = false
        tableView.reloadData()
        issueSearchAndScope.resignFirstResponder()
    }

}
