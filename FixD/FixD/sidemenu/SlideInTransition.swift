//
//  SlideInTransition.swift
//  FixD
//
//  Created by Karen Deng on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    let toViewController = UIViewController()
    var move = CGFloat(0.0)
    
    //takes 3 seconds to appear on the screen
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 1.0
    }
    
    
    //animates the screen
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {
                    return
        
        }
        
        //let containerView = transitionContext.containerView
        let containerView: UIWindow? = UIApplication.shared.keyWindow
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        
        //bring side menu onto screen
        if isPresenting {
            //add dimming view
            
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView?.addSubview(dimmingView)
            dimmingView.frame = containerView!.bounds
            
            //add menu view controller to container
            containerView?.addSubview(toViewController.view)
            
            //init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
            
            
            let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOut(_:)))
            dimmingView.addGestureRecognizer(tapRecognizer)
            
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(tapOut(_:)))
            leftSwipe.direction = .left
            dimmingView.addGestureRecognizer(leftSwipe)

        }
        
        //animate onto screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: CGFloat(finalWidth), y: 0)
            
        }
        
        //animate back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        
        //if isPresenting is true/false present transform or identity
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform(): identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    
    @objc func tapOut(_ sender: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name("tapOutBBY"), object: nil)
    }
}
