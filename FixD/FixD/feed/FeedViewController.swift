//
//  FeedViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class FeedIssueCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var issueName: UILabel!
    @IBOutlet weak var issueDescription: UILabel!
    @IBOutlet weak var issueLocation: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var issueTime: UILabel!
    @IBOutlet weak var issueDate: UILabel!
    
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var issueUpvotes: UILabel!
    @IBOutlet weak var issueFavorites: UILabel!
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!
    
    var myIssue: IssueClass!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(like(_:)))
        likeView.addGestureRecognizer(tap)
        
        let favoriteTap = UITapGestureRecognizer(target: self, action: #selector(favorite(_:)))
        starView.addGestureRecognizer(favoriteTap)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //getIssueData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setIssue(issue: IssueClass){
        myIssue = issue
    }
    
    @objc func like(_ sender: Any) {
        self.myIssue.checkLiked(id: self.myIssue.getID())
        self.issueUpvotes.text = String(self.myIssue.getUpVotes())
        if (myIssue.getUpVoteState()){
            upVoteButton.setImage(UIImage(named: "filled heart"), for: .normal)
        }else {
            upVoteButton.setImage(UIImage(named: "heart-1"), for: .normal)
        }
    }
    
    @IBAction func upVote(_ sender: Any) {
        like(sender)
    }
    
    @IBAction func favorite(_ sender: Any) {
        self.myIssue.checkFavorited(id: self.myIssue.getID())
        
        self.issueFavorites.text = String(self.myIssue.getFavorites())
        if (myIssue.getFavoritesState()){
            favoritesButton.setImage(UIImage(named: "filled star"), for: .normal)
        }else {
            favoritesButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
}



class FeedViewController: UITableViewController,  UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate{
    
    let transition = SlideInTransition()
    var topView: UIView?
    let myCellIndentifier = "IssueCell"
    var myIssueList:[IssueClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Issue Data for Feed
        getIssueData()

        self.tableView.delegate = self
        self.tableView.dataSource = self
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
    
    func getIssueData() {
        NetworkAPI().getListOfIssues() { issueData in
            self.myIssueList = issueData
            self.tableView.reloadData()
        }
    }
    

    @objc func refresh(_ sender: Any) {
        getIssueData()
        self.refreshControl!.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePage", sender: self)
    }
    
    @IBOutlet var feedTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IssuePageController {
            let viewController = segue.destination as? IssuePageController
            if let indexPath = feedTable.indexPathForSelectedRow{
                let currCell = feedTable.cellForRow(at: indexPath) as! FeedIssueCell
                viewController?.issueID = currCell.myIssue.getID()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //#warning Incomplete implementation, return the number of rows
        return myIssueList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIndentifier, for: indexPath) as! FeedIssueCell

         //Configure the cell...
        let obj = myIssueList.sorted(by: { $0.myLikes > $1.myLikes })[indexPath.row]
        
        cell.setIssue(issue: obj)
        cell.issueName.text = obj.getTitle()
        cell.issueDescription.text = obj.getDescription()
        cell.issueLocation.text = obj.getLocation()
        if obj.getIssueImage() != ""  {
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
        }
        cell.issueUpvotes.text = String(obj.getUpVotes())
        cell.issueFavorites.text = String(obj.getFavorites())
        NetworkAPI().getUserById(id: obj.getID()) { user in
            cell.userName.text = user.userName
            cell.userImage.image = UIImage(named: user.userImage)
        }
        cell.issueDate.text = obj.getIssueDate()
        cell.issueTime.text = obj.getIssueTime()
        
        return cell
    }
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        self.openMenu()
    }
    
    @objc func swipePanAction(sender: UIScreenEdgePanGestureRecognizer) {

        if sender.state == UIGestureRecognizer.State.ended {
            self.openMenu()
        }
        
    }
    
    //when you click a button on the side menu, it brings you to another page
    func transitionToNew(_ menuType: MenuType) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tab") as? UITabBarController else {
            return
        }
        
        guard let logOutController = storyBoard.instantiateViewController(withIdentifier: "login") as? UIViewController else {
            return
        }
        
        
        switch menuType {
        case .map:
            
            nextViewController.selectedIndex = 1
            self.present(nextViewController, animated:false, completion:nil)
            
        case .account:
            
            nextViewController.selectedIndex = 2
            self.present(nextViewController, animated:false, completion:nil)
            
        case .logout:
            let navigationController = UINavigationController(rootViewController: logOutController)
            self.present(navigationController, animated:false, completion: nil)
            
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
