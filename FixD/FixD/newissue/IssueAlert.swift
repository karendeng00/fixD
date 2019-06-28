//
//  IssueAlert.swift
//  FixD
//
//  Created by Ann Bailey on 6/27/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import Foundation
import UIKit

class IssueAlert {
    
    private let myVC:UIViewController
    
    init(VC:UIViewController) {
        self.myVC = VC
    }

    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        myVC.present(alert, animated: true, completion: nil)
    }

}
