//
//  SideMenuTableViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("ShowSideMenu"), object: nil)
        print(indexPath.row)
    }
}
