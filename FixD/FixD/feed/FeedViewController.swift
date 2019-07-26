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
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var comButton: UIButton!
    
    @IBOutlet var views: [UIView]!
    
    @IBOutlet weak var issueName: UILabel!
    @IBOutlet weak var issueDescription: UILabel!
    @IBOutlet weak var issueLocation: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var issueTime: UILabel!
    @IBOutlet weak var issueDate: UILabel!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!

    
    var myIssue: IssueClass!
    
    let white = UIColor(cgColor: CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])!)
    let granite = UIColor(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 0.5)
    let dukeblue = UIColor(red: 0/255.0, green: 83/255.0, blue: 155/255.0, alpha: 0.5)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (myIssue.getUpVoteState()){
            likeButton.setImage(UIImage(named: "filled heart"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "heart-1"), for: .normal)
        }
        
        if (myIssue.getFavoritesState()){
            starButton.setImage(UIImage(named: "filled star"), for: .normal)
        }else {
            starButton.setImage(UIImage(named: "star"), for: .normal)
        }
        
        for v in views {
            v.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
            v.layer.masksToBounds = false
            v.layer.cornerRadius = 2.0
            v.layer.shadowOffset = CGSize(width: -1.5, height: 1.5)
            v.layer.shadowOpacity = 0.22
        }
        
        let longLike = UILongPressGestureRecognizer(target: self, action: #selector(longL(_:)))
        longLike.minimumPressDuration = 0
        likeView.addGestureRecognizer(longLike)
        
        let longFav = UILongPressGestureRecognizer(target: self, action: #selector(longF(_:)))
        longFav.minimumPressDuration = 0
        starView.addGestureRecognizer(longFav)
        
        let longCom = UILongPressGestureRecognizer(target: self, action: #selector(longC(_:)))
        longCom.minimumPressDuration = 0
        commentView.addGestureRecognizer(longCom)
        
    }
    
    @objc func longL(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            likeView.backgroundColor = white
            likeView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            NotificationCenter.default.post(name: NSNotification.Name("CheckLikeIssue"), object: myIssue)
            if (myIssue.getUpVoteState()){
                likeButton.setImage(UIImage(named: "filled heart"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "heart-1"), for: .normal)
            }
        }
            
        else {
            likeView.backgroundColor = granite
            likeView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
    }
    
    @objc func longF(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            starView.backgroundColor = white
            starView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            NotificationCenter.default.post(name: NSNotification.Name("CheckFavoriteIssue"), object: myIssue)
            if (myIssue.getFavoritesState()){
                starButton.setImage(UIImage(named: "filled star"), for: .normal)
            }else {
                starButton.setImage(UIImage(named: "star"), for: .normal)
            }
        }
        else {
            starView.backgroundColor = granite
            starView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
    @objc func longC(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            commentView.backgroundColor = white
            commentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        }
        else {
            commentView.backgroundColor = granite
            commentView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setIssue(issue: IssueClass){
        myIssue = issue
    }
    
}


class FeedViewController: UITableViewController,  UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate, UISearchBarDelegate {
    
    let transition = SlideInTransition()
    var topView: UIView?
    let myCellIndentifier = "IssueCell"
    var myIssueList:[IssueClass] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload(_:)), name: NSNotification.Name("CHECK"), object: nil)
        
        NetworkAPI().setUpUser(nav: self.navigationController!) { result in
            //Get Issue Data for Feed
            self.getIssueData()
        }

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.refreshControl = UIRefreshControl()
        
        //creates menu button
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 15)
        menuBtn.setImage(UIImage(named:"wMenu"), for: .normal)
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
        
        feedSearchBar.text = "Search issue by title"
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += feedSearchBar.frame.size.height
        tableView.contentOffset = contentOffset

        setupNotificationListener()
        
    }
    
    @objc func reload(_ sender: Any) {
        self.tableView.reloadData()
    }
    
    func getIssueData() {
        let nav = self.navigationController!
        NetworkAPI().getListOfIssues(nav: nav) { issueData, error  in
            self.myIssueList = issueData
            self.tableView.reloadData()
        }
    }

    @objc func refresh(_ sender: Any) {
        getIssueData()
        self.refreshControl!.endRefreshing()
    }
    
    func setupNotificationListener() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(checkLikeIssue(notification:)), name: NSNotification.Name("CheckLikeIssue"), object: nil)
        notificationCenter.addObserver(self, selector: #selector(checkFavoriteIssue(notification:)), name: NSNotification.Name("CheckFavoriteIssue"), object: nil)
    }
    
    @objc func checkLikeIssue(notification: Notification) {
        if let issue = notification.object as? IssueClass {
            issue.checkLiked(id: issue.getID(), nav: self.navigationController!)
        }
    }
    
    @objc func checkFavoriteIssue(notification: Notification) {
        if let issue = notification.object as? IssueClass {
            issue.checkFavorited(id: issue.getID(), nav: self.navigationController!)
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowIssuePage", sender: self)
    }
    
    @IBOutlet var feedTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowIssuePage" {
            let viewController = segue.destination as? IssuePageController
            if let indexPath = feedTable.indexPathForSelectedRow{
                let currCell = feedTable.cellForRow(at: indexPath) as! FeedIssueCell
                viewController?.issueID = currCell.myIssue.getID()
            }
            viewController?.likeButtonHandler = {
                self.getIssueData()
            }
            viewController?.favButtonHandler = {
                self.getIssueData()
            }
            viewController?.feedScrollHandler = {
                self.tableView.scrollToRow(at: self.tableView.indexPathForSelectedRow!, at: UITableView.ScrollPosition.middle, animated: false)
            }
        }
        if segue.identifier == "comSegue" {
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //#warning Incomplete implementation, return the number of rows
        if searching {
            return feedSearchIssues.count
        } else {
            return myIssueList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = myIssueList.sorted(by: { $0.myLikes > $1.myLikes })[indexPath.row]
        
        let all = !UserDefaults.standard.bool(forKey: "checkOIT") && !UserDefaults.standard.bool(forKey: "checkParking") && !UserDefaults.standard.bool(forKey: "checkFacilities") && !UserDefaults.standard.bool(forKey: "checkHRL") && !UserDefaults.standard.bool(forKey: "liked") && !UserDefaults.standard.bool(forKey: "starred")
        let check = UserDefaults.standard.bool(forKey: "checkOIT") ||  UserDefaults.standard.bool(forKey: "checkParking") || UserDefaults.standard.bool(forKey: "checkFacilities") || UserDefaults.standard.bool(forKey: "checkHRL")
        let oit = UserDefaults.standard.bool(forKey: "checkOIT") && obj.getType() == ("SnIssue")
        let park = UserDefaults.standard.bool(forKey: "checkParking") && obj.getType() == ("PtIssue")
        let fac = UserDefaults.standard.bool(forKey: "checkFacilities") && obj.getType() == ("EamIssue")
        let hrl = UserDefaults.standard.bool(forKey: "checkHRL") && obj.getType() == ("HrlIssue")
        let checkLike = UserDefaults.standard.bool(forKey: "liked")
        let checkFav = UserDefaults.standard.bool(forKey: "starred")
        let like = UserDefaults.standard.bool(forKey: "liked") && obj.getUpVoteState()
        let fav = UserDefaults.standard.bool(forKey: "starred") && obj.getFavoritesState()
        
        if(checkLike && checkFav && check) {
            if(like && fav && (oit || park || fac || hrl)) {
                return 210
            }
            else {
                return 0
            }
        }
        if(checkLike && checkFav) {
            if (like && fav) {
                return 210
            }
            else {
                return 0
            }
        }
        if(checkLike && check) {
            if(like && (oit || park || fac || hrl)) {
                return 210
            }
            else {
                return 0
            }
        }
        if(checkFav && check) {
            if(fav && (oit || park || fac || hrl)) {
                return 210
            }
            else {
                return 0
            }
        }
        if (checkLike) {
            if (like) {
                return 210
            }
            else {
                return 0
            }
        }
        if(checkFav) {
            if (fav) {
                return 210
            }
            else {
                return 0
            }
        }
        if (all || oit || park || fac || hrl ) {
            return 210
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIndentifier, for: indexPath) as! FeedIssueCell
        if searching {
            let obj = feedSearchIssues.sorted(by: { $0.myLikes > $1.myLikes })[indexPath.row]
            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            cell.userName.text = obj.myUserName
            cell.userImage.image = UIImage(named: obj.myUserImage)
            cell.issueDate.text = obj.getIssueDate()
            cell.issueTime.text = obj.getIssueTime()
        }
        else {
            let obj = myIssueList.sorted(by: { $0.myLikes > $1.myLikes })[indexPath.row]
            cell.setIssue(issue: obj)
            cell.issueName.text = obj.getTitle()
            cell.issueDescription.text = obj.getDescription()
            cell.issueLocation.text = obj.getLocation()
            cell.issueImage.image = UIImage(named: obj.getIssueImage())
            cell.userName.text = obj.myUserName
            cell.userImage.image = UIImage(named: obj.myUserImage)
            cell.issueDate.text = obj.getIssueDate()
            cell.issueTime.text = obj.getIssueTime()
        }
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
    
    @IBAction func addComment(_ sender: Any) {
        performSegue(withIdentifier: "comSegue", sender: self)
    }
    
    
    @IBOutlet weak var feedSearchBar: UISearchBar!
    var feedIssueList = Set<IssueClass>()
    var feedSearchIssues = [IssueClass]()
    var searching = false

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        feedSearchIssues = myIssueList.filter({( issue:IssueClass) -> Bool in
            return issue.getTitle().lowercased().contains(searchText.lowercased())
        })
        searching = true
        tableView.reloadData()
        
        if searchText == "" {
            searching = false
            tableView.reloadData()
        }
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        feedSearchBar.text = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        feedSearchBar.text = "Search issue by title"
        searching = false
        tableView.reloadData()
        feedSearchBar.resignFirstResponder()
    }

}
