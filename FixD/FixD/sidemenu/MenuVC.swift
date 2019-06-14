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

class MenuVC: UITableViewController, UIGestureRecognizerDelegate{
    

    //variable didTapMenuType is of type MenuType -> Void
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("this page has loaded")
        
        
        //swipe back in
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(sender:)))
        leftSwipe.direction = .left
        leftSwipe.delegate = self
    
        self.view.addGestureRecognizer(leftSwipe)
        
        NotificationCenter.default.addObserver(self, selector: #selector(timeToGo(_:)), name: NSNotification.Name("tapOutBBY"), object: nil)
        
        
    }
    
    @objc func timeToGo(_ notification:Notification) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
extension MenuVC: UIViewControllerTransitioningDelegate {
    @objc func swipeAction(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    
    
}



