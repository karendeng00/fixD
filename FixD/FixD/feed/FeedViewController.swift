//
//  FeedViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController,  UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate{
    
    let transition = SlideInTransition()
    var topView: UIView?
    let myCellIndentifier = "IssueCell"
    var myPosts:[IssueClass]?
    let Issues = IssueBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPosts = Issues.myPosts
        self.refreshControl = UIRefreshControl()
        //creates menu button
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 15)
        menuBtn.setImage(UIImage(named:"menu"), for: .normal)
        menuBtn.addTarget(self, action: #selector(didTapMenu(_:)), for: UIControl.Event.touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 23)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 23)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
    
        
        
        //puts in left pan swipe gesture
        let leftPanSwipe = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipePanAction(sender:)))
        leftPanSwipe.edges = .left
        leftPanSwipe.delegate = self
        self.view.addGestureRecognizer(leftPanSwipe)
        
        // Add Refresh Control to Table View
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
    
    }
    
    @objc func refresh(_ sender: Any) {
        print("refreshed")
        self.refreshControl!.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePage", sender: self)
    }
    
    @IBOutlet var feedTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let row = feedTable.indexPathForSelectedRow?.row{
                viewController?.issueID = row
                viewController?.issue = myPosts![row]
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIndentifier, for: indexPath) as! FeedIssueCell

         //Configure the cell...
        let obj = myPosts![indexPath.row]
        
        cell.setIssueID(ID: indexPath.row)
        cell.issueName.text = obj.getTitle()
        cell.issueDescription.text = obj.getDescription()
        cell.issueLocation.text = obj.getLocation()
        cell.issueDate.text = obj.getDate()
        cell.issueImage.image = UIImage(named: obj.getIssueImage())
        cell.issueUpvotes.text = String(obj.getUpVotes())
        cell.issueFavorites.text = String(obj.getFavorites())
        
        cell.userName.text = obj.getUser().userName
        cell.userImage.image = UIImage(named:obj.getUser().userImage)
        
        cell.locationImage.image = UIImage(named:"locicon")
    
        return cell
    }
    
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        self.openMenu()
        print("tapped menu")
    }
    

    
    @objc func swipePanAction(sender: UIScreenEdgePanGestureRecognizer) {
        
        
        if sender.state == UIGestureRecognizer.State.ended {
            self.openMenu()
        }
    
        // retrieve the current state of the gesture
        /*if sender.state == UIGestureRecognizer.State.began {
            
            // if the user has just started dragging, make sure view for dimming effect is hidden well
        }
        
        else if (sender.state == UIGestureRecognizer.State.changed) {
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            
            if -constraintMenuWidth + translationX > 0 {
                
                // viewMenu fully dragged out
                transition.move = constraintMenuWidth
                print("number 1")
                //fully black - viewBlack.alpha = maxBlackViewAlpha
            }
            else if translationX < 0 {
                // viewMenu fully dragged in
                transition.move = 0
                print("number 2")
                //no black - viewBlack.alpha = 0
            } else {
                
                // viewMenu is being dragged somewhere between min and max amount
                transition.move = translationX
                print("number 3")
                //let ratio = translationX / constraintMenuWidth.constant
                //blackness ratio - let alphaValue = ratio * maxBlackViewAlpha
                //viewBlack.alpha = alphaValue
            }
        }
        else {
            // if the menu was dragged less than half of it's width, close it. Otherwise, open it.
            if transition.move < constraintMenuWidth / 2 {
                topView?.removeFromSuperview()
                
            }
            else {
                self.openMenu()
                print("opened")
            }
        }*/
        
    }
    
    //when you click a button on the side menu, it brings you to another page
    func transitionToNew(_ menuType: MenuType) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tab") as? UITabBarController else {
            return
        }
        switch menuType {
        case .home:
            topView?.removeFromSuperview()
            nextViewController.selectedIndex = 0
            self.present(nextViewController, animated:false, completion:nil)
        case .map:
           topView?.removeFromSuperview()
            nextViewController.selectedIndex = 1
            self.present(nextViewController, animated:false, completion:nil)
            
        case .account:
            topView?.removeFromSuperview()
            nextViewController.selectedIndex = 2
            self.present(nextViewController, animated:false, completion:nil)
          
        case .settings:
            topView?.removeFromSuperview()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            guard let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as? UITableViewController else {
                return
            }
            self.present(settingsViewController, animated:false, completion:nil)
    
        case .filter:
           NotificationCenter.default.post(name: NSNotification.Name("clickedFilter"), object: nil)
        
        default:
            break
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
