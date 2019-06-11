//
//  HomeVC.swift
//  FixD
//
//  Created by Karen Deng on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    
    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuVC else {
            return
        }
        
        
        menuVC.didTapMenuType = {
            MenuType in
            self.transitionToNew(MenuType)
            
        }
        
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
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

extension HomeVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
