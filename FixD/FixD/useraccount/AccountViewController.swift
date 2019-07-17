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
    
    var myUser = UserAccount.account
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUser()
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 15)
        menuBtn.setImage(UIImage(named:"wMenu"), for: .normal)
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
    
    func setUpUser() {
        myAccountImage.image = UIImage(named:myUser.userImage ?? "photo.jpg")
        myAccountName.text = myUser.userName
        myAccountPosition.text = "Student"
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
        
        guard let logOutController = storyBoard.instantiateViewController(withIdentifier: "login") as? UIViewController else {
            return
        }
        
        switch menuType {
        case .home:
            nextViewController.selectedIndex = 0
            self.present(nextViewController, animated:false, completion:nil)
        case .map:
            nextViewController.selectedIndex = 1
            self.present(nextViewController, animated:false, completion:nil)            
        case .logout:
            let navigationController = UINavigationController(rootViewController: logOutController)
            self.present(navigationController, animated:false, completion: nil)
            
            
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

}
