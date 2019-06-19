//
//  AccountViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,  UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var myAccountPosition: UILabel!
    @IBOutlet weak var myAccountName: UILabel!
    @IBOutlet weak var myAccountImage: UIImageView!
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAccountImage.image = UIImage(named:"blue devil.jpg")
        //myAccountName.text = UILabel
        //myAccountPosition.text = UILabel
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 15)
        menuBtn.setImage(UIImage(named:"menu"), for: .normal)
        menuBtn.addTarget(self, action: #selector(tapMenu(_:)), for: UIControl.Event.touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 23)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 23)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
        
        
        let leftPanSwipe = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipePanAction(sender:)))
        leftPanSwipe.edges = .left
        leftPanSwipe.delegate = self
        self.view.addGestureRecognizer(leftPanSwipe)
    }
    
    @IBAction func tapMenu(_ sender: UIButton) {
        self.openMenu()
    }
    
    @objc func swipePanAction(sender: UIScreenEdgePanGestureRecognizer) {
        
        
        if sender.state == UIGestureRecognizer.State.ended {
            self.openMenu()
        }
    }
    
    func openMenu() {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuVC else {
            return
        }
        
        //transition to new page
        menuVC.didTapMenuType = {
            menuType in
            self.transitionToNew(menuType)
            
        }
        
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        
        topView?.removeFromSuperview()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tab") as? UITabBarController else {
            return
        }
        switch menuType {
        case .home:
            nextViewController.selectedIndex = 0
            self.present(nextViewController, animated:false, completion:nil)
        case .map:
            
            nextViewController.selectedIndex = 1
            self.present(nextViewController, animated:false, completion:nil)
            
        case .account:
            nextViewController.selectedIndex = 2
            self.present(nextViewController, animated:false, completion:nil)
            
        case .settings:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            guard let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as? UITableViewController else {
                return
            }
            self.present(settingsViewController, animated:false, completion:nil)
            
            
            
        default:
            break
        }
    }
    
    //put side menu out
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    //put side menu back in
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
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
