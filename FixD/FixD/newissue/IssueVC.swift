//
//  IssueVC.swift
//  FixD
//
//  Created by Ann Bailey on 7/1/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit
import iOSDropDown

class IssueVC: UIViewController {
    
    let myVC:UIViewController
    private var myDropDowns:[DropDown]
    private var myDropDownLists:[[String]]
    
    init(viewController:UIViewController, dropDowns:[DropDown], dropDownLists:[[String]]) {
        myVC = viewController
        myDropDowns = dropDowns
        myDropDownLists = dropDownLists
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkSelections(selectionsList:[String]) -> Bool {
        for selection in selectionsList {
            if selection == "Please select" {
                return false
            }
        }
        return true
    }
    
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        myVC.present(alert, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    
}
