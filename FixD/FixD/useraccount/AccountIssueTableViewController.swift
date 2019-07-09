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
    var myIssueDict:[Int: IssueClass] = [:]
    var issueIDS:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getIssueData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueIDS.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! FeedIssueCell
        
        let obj = myIssueDict[issueIDS[indexPath.row]]!
        
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
        IssueLoader().getData() { issueData in
            self.myIssueDict = issueData
            self.issueIDS = Array(self.myIssueDict.keys)
            self.tableView.reloadData()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
