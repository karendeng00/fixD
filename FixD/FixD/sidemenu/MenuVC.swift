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

class MenuVC: UITableViewController{
    
    
    //variable didTapMenuType is of type MenuType -> Void
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("this page has loaded")
        
        /*let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(sender:)))
        leftSwipe.direction = .left
        leftSwipe.delegate = self
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(sender:)))
        rightSwipe.direction = .right
        rightSwipe.delegate = self
        
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
        
        // Do any additional setup after loading the view.*/
    }

    
    override func tableView(_ tableView: UITableView,
                            leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("OK, marked as Closed")
            success(true)
        })
        
        print("right")
        
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    //left swipe
    /*override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }*/
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //specify which menutype row
        guard let menuType = MenuType(rawValue: indexPath.row) else {
            return
        }
        
        //if you select a row, dismiss the menu vc
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
        }
        
    }
    
    //right swipe
    


}
/*extension MenuVC: UIViewControllerTransitioningDelegate {
    /*@objc func swipeAction(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                print("this works")
            default:
                break
            }
        }*/
        /*switch swipe.direction.rawValue {
         case 1:
         print("you are going left")
         case 2:
         print("you are going right")
         default:
         break
         }*/
    
}*/

