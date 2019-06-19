//
//  MenuVC.swift
//  FixD
//
//  Created by Karen Deng on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit


enum MenuType: Int {
    case home
    case map
    case account
    case settings
    case filter
}


class MenuVC: UITableViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var filterButton: UIButton!
    
    var didTapMenuType: ((MenuType) -> Void)?
    //variable didTapMenuType is of type MenuType -> Void
    var check = false
    var row = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("this page has loaded")
        
        //swipe back in
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(sender:)))
        leftSwipe.direction = .left
        leftSwipe.delegate = self
    
        self.view.addGestureRecognizer(leftSwipe)
        
        NotificationCenter.default.addObserver(self, selector: #selector(timeToGo(_:)), name: NSNotification.Name("tapOutBBY"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(leave(_:)), name: NSNotification.Name("clickedFilter"), object: nil)
 
        
        
    }
    
    @objc func timeToGo(_ notification:Notification) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func leave(_ notification:Notification) {
        print("leave")
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
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



