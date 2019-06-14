//
//  FeedViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController,  UIGestureRecognizerDelegate{
    
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    
    let myCellIndentifier = "IssueCell"
    var myPosts:[IssueClass]?
    //FIXME: delete 
    let Issues = IssueBuilder()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if sender.state == .ended {
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
    
}

extension FeedViewController: UIViewControllerTransitioningDelegate {
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
