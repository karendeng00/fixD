//
//  IssueFeedViewController.swift
//  FixD
//
//  Created by Karen Deng on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class IssueFeedViewController: UIViewController {

    
    let transition = SlideInTransition()
    var topView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //when you tap the menu button
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuVC else {
            return
        }
        
        //transition to new page
        menuVC.didTapMenuType = {
            MenuType in
            self.transitionToNew(MenuType)
            
        }
        
        
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
    
    //when you click a button on the side menu, it brings you to another page
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        
        switch menuType {
        case .location:
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            
            
            
        case .category:
            let view = UIView()
            view.backgroundColor = .blue
            view.frame = self.view.bounds
            self.view.addSubview(view)
            
        default:
            break
            
        }
    }
}

extension IssueFeedViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
