//
//  MenuVC.swift
//  FixD
//
//  Created by Karen Deng on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case map
    case account
    case filter
    case liked
    case starred
    case location
    case location2
    case category
    case category2
    case logout
}

import MapKit

class MenuVC: UITableViewController, UIGestureRecognizerDelegate {
    
    let locationManager = CLLocationManager()
    
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPosition: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    //issues I've...
    @IBOutlet weak var likeBox: UIImageView!
    @IBOutlet weak var starredBox: UIImageView!
    
    
    //filter
    @IBOutlet weak var filterImage: UIImageView!
    @IBOutlet var filterOptions: [UIView]!
    
    //category
    
    @IBOutlet weak var categoryArrow: UIImageView!
    @IBOutlet weak var categoryOptions: UIView!
    
    //location
    @IBOutlet weak var location: UIView!
    @IBOutlet weak var locationArrow: UIImageView!
    
    //category buttons
    @IBOutlet weak var facilitiesButton: UIButton!
    @IBOutlet weak var hrlButton: UIButton!
    @IBOutlet weak var parkingButton: UIButton!
    @IBOutlet weak var oitButton: UIButton!
    
    let myUser = UserAccount.shared
    
    var check = false
    var checkCategory = false
    var checkFacilities = UserDefaults.standard.bool(forKey: "checkFacilities")
    var checkHRL = UserDefaults.standard.bool(forKey: "checkHRL")
    var checkParking = UserDefaults.standard.bool(forKey: "checkParking")
    var checkOIT = UserDefaults.standard.bool(forKey: "checkOIT")
    var checkLiked = UserDefaults.standard.bool(forKey: "liked")
    var checkStarred = UserDefaults.standard.bool(forKey: "starred")
    var checkLoc = false
    var height = 60.0
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    var row = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUser()
        
    tableView.estimatedRowHeight = 60.0;
        tableView.rowHeight = UITableView.automaticDimension
        
        //swipe back in
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(sender:)))
        leftSwipe.direction = .left
        leftSwipe.delegate = self
    
        self.view.addGestureRecognizer(leftSwipe)
        
        NotificationCenter.default.addObserver(self, selector: #selector(timeToGo(_:)), name: NSNotification.Name("tapOutBBY"), object: nil)
        
        facilitiesButton.setImage(UIImage(named: "box\(!checkFacilities)"), for: .normal)
        hrlButton.setImage(UIImage(named: "box\(!checkHRL)"), for: .normal)
        parkingButton.setImage(UIImage(named: "box\(!checkParking)"), for: .normal)
        oitButton.setImage(UIImage(named: "box\(!checkOIT)"), for: .normal)
        likeBox.image = UIImage(named: "box\(!checkLiked)")
        starredBox.image = UIImage(named: "box\(!checkStarred)")
        
    }
    
    func setUpUser() {
        userName.text = myUser.getUserName()
        userImage.image = UIImage(named: myUser.getUserImage())
    }

    @IBAction func facilities(_ sender: UIButton) {
        sender.setImage(UIImage(named: "box\(checkFacilities)"), for: .normal)
        UserDefaults.standard.set(!checkFacilities, forKey: "checkFacilities")
        checkFacilities = !checkFacilities
        NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
    }
    
    @IBAction func hrl(_ sender: UIButton) {
        sender.setImage(UIImage(named: "box\(checkHRL)"), for: .normal)
        UserDefaults.standard.set(!checkHRL, forKey: "checkHRL")
        checkHRL = !checkHRL
        NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
    }
    
    @IBAction func parking(_ sender: UIButton) {
        sender.setImage(UIImage(named: "box\(checkParking)"), for: .normal)
        UserDefaults.standard.set(!checkParking, forKey: "checkParking")
        checkParking = !checkParking
        NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
    }
    
    @IBAction func oit(_ sender: UIButton) {
        sender.setImage(UIImage(named: "box\(checkOIT)"), for: .normal)
        UserDefaults.standard.set(!checkOIT, forKey: "checkOIT")
        checkOIT = !checkOIT
        NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
    }
    
    @objc func timeToGo(_ notification:Notification) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        if(indexPath.row <= 2) {
            dismiss(animated: true)
            self.didTapMenuType!(menuType)
        }
        
        if(indexPath.row == 3) {
            filterImage.image = UIImage(named: "arrow\(check)")
            //if check is true and you select it
            if(check) {
                categoryArrow.image = UIImage(named: "arrowtrue")
                categoryOptions.isHidden = true
                
                locationArrow.image = UIImage(named: "arrowtrue")
                location.isHidden = true
                
                checkLoc = false
                checkCategory = false
                
            }
            check = !check
            filterOptions.forEach { (option) in
                option.isHidden = !option.isHidden
            }
            self.tableView.reloadData()
        }
        
        //issues I've liked
        if(indexPath.row == 4) {
            likeBox.image = UIImage(named: "box\(checkLiked)")
            UserDefaults.standard.set(!checkLiked, forKey: "liked")
            checkLiked = !checkLiked
            NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
        }
        
        if(indexPath.row == 5) {
            starredBox.image = UIImage(named: "box\(checkStarred)")
            UserDefaults.standard.set(!checkStarred, forKey: "starred")
            checkStarred = !checkStarred
            NotificationCenter.default.post(name: NSNotification.Name("CHECK"), object: nil)
        }
        
        
        
        if(indexPath.row == 6) {
            locationArrow.image = UIImage(named: "arrow\(checkLoc)")
            location.isHidden = checkLoc
            checkLoc = !checkLoc
            
            self.tableView.reloadData()
        }
        
        if(indexPath.row == 8) {
            categoryArrow.image = UIImage(named: "arrow\(checkCategory)")
            categoryOptions.isHidden = checkCategory
            checkCategory = !checkCategory
        
            self.tableView.reloadData()
        }
        
        if(indexPath.row == 10) {
            dismiss(animated: true)
            if(OAuthService.shared.isAuthenticated()) {
                OAuthService.shared.logout()
            }
            self.didTapMenuType!(menuType)
        }
        
    }
    
    
 
    //if check == false, collapsed
    //if check == true, expand
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !check && indexPath.row > 3 && indexPath.row != 10{
            return 0
        }
        
        if check && !checkLoc && indexPath.row == 7{
            return 0
        }
        if check && !checkCategory && indexPath.row == 9 {
            return 0
        }
        
        if(indexPath.row == 9 || indexPath.row == 7) {
            return 150
        }
        return 60
    }
}

extension MenuVC: UIViewControllerTransitioningDelegate {
    @objc func swipeAction(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }

    
    
}

