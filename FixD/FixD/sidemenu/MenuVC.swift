//
//  MenuVC.swift
//  FixD
//
//  Created by Karen Deng on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case location
    case category
    case liked
    case starred
}

class MenuVC: UITableViewController {
    
    
    //variable didTapMenuType is of type MenuType -> Void
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //optional
        guard let menuType = MenuType(rawValue: indexPath.row) else {
            return
        }
        //
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
        }
        
    }

}
