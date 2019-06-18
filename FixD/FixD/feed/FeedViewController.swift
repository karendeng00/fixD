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
    
    var finalHeight = 0.0
    var finalWidth = 0.0
    
    let myCellIndentifier = "IssueCell"
    var myPosts:[IssueClass]?
    //FIXME: delete 
    let Issues = IssueBuilder()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalHeight = Double(self.view.bounds.height)
        finalWidth = Double(self.view.bounds.width * 0.8)
        
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
        myPosts = Issues.getIssues()
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePage", sender: (Any).self)
    }
    
    @IBOutlet var feedTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let row = feedTable.indexPathForSelectedRow?.row{
                viewController?.issueID = row
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    }
    
    
    @objc func swipePanAction(sender: UIScreenEdgePanGestureRecognizer) {
        
        if (sender.state == UIGestureRecognizer.State.changed) {
            let constraintMenuWidth  = self.view.bounds.width * 0.8
            
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            
            //if dragged less than half way through
            if translationX * 2 < constraintMenuWidth {
                
                //constraintMenuLeft.constant = -constraintMenuWidth.constant + translationX
                print("true")
                return
            }
            
        
        }
        else {
            switch sender.edges {
                case .left:
                    self.openMenu()
                default:
                    break
            }
        }
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
    
    
    func openMenu() {
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
    


    //put side menu out
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        transition.finalHeight = finalHeight
        transition.finalWidth = finalWidth
        return transition
    }
    
    //put side menu back in
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        transition.finalHeight = finalHeight
        transition.finalWidth = finalWidth
        return transition
    }
    
}
