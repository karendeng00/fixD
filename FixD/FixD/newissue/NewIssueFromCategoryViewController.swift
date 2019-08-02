//
//  NewIssueFromCategoryViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 7/19/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueFromCategoryViewController: UIViewController {

    var myIssue = IssueClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //segues to correct issue page depending on which button the user selects
    //also sets issue type in the database
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceNowSegue" {
            let viewController = segue.destination as? OITredoViewController
            myIssue.setType(type: "SnIssue") //This type ties it back to the database!
            viewController?.myIssue = myIssue
        }
        else if segue.identifier == "HRLSegue" {
            let viewController = segue.destination as? HRLredoViewController
            myIssue.setType(type: "HrlIssue") //This type ties it back to the database!
            viewController?.myIssue = myIssue
        }
        else if segue.identifier == "FacilitiesSegue" {
            let viewController = segue.destination as? NewIssueFMDViewController
            myIssue.setType(type: "EamIssue") //This type ties it back to the database!
            viewController?.myIssue = myIssue
        }
        else if segue.identifier == "ParkingSegue" {
            let viewController = segue.destination as? NewIssuePTSViewController
            myIssue.setType(type: "PtIssue") //This type ties it back to the database!
            viewController?.myIssue = myIssue
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
