//
//  IssuePageController.swift
//  FixD
//
//  Created by Duc Tran on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//This table cell is used to access the views and objecs in a textCommentCell
class textCommentCell: UITableViewCell{
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var commentUserImage: UIImageView!
    @IBOutlet weak var commentPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class IssuePageController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var comView: UIView!
    @IBOutlet weak var sendView: UIView!
    
    @IBOutlet var views: [UIView]!
    
    @IBOutlet weak var cameraView: UIView!
    
    @IBOutlet weak var galleryView: UIView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var comButton: UIButton!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentView: UITableView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var likeAndFavoriteAmountLabel: UILabel!
   
    var comments:[CommentsClass] = []
    var issueID:Int = 0
    var myIssue = IssueClass()
    let myUser = UserAccount.shared
    var tempImg: UIImage?
    var hasImage = false
    
    private var tabBarHeight:CGFloat = 0
    private var navBarHeight:CGFloat = 0
    private var statusBarHeight:CGFloat = 0
    
    let white = UIColor(cgColor: CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])!)
    let granite = UIColor(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 0.5)
    
    //Handles Refresing the Likes and Favorites on the feed
    var likeButtonHandler:(() -> ())?
    var favButtonHandler:(() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This allows for the commentView and commentTextField to be controlled by this class
        commentTextField.delegate = self
        commentView.delegate = self
        commentView.dataSource = self
        
        loadIssue()
        
        //Heights needed to adjust the screen for when the keyboard appears
        tabBarHeight = tabBarController?.tabBar.bounds.size.height ?? 0
        navBarHeight = navigationController?.navigationBar.bounds.size.height ?? 0
        statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        self.commentView.reloadData()
        //Code to set up and event listener
            listenForNotifications()
        
        //Code to customize the look of the views in the IssuePage Screen
        for v in views {
            v.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
            v.layer.masksToBounds = false
            v.layer.cornerRadius = 2.0
            v.layer.shadowOffset = CGSize(width: -1.5, height: 1.5)
            v.layer.shadowOpacity = 0.22
        }
        
        issueImage.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
        issueImage.layer.masksToBounds = false
        issueImage.layer.cornerRadius = 2.0
        issueImage.layer.shadowOffset = CGSize(width: -1, height: 1)
        issueImage.layer.shadowOpacity = 0.2
        
        //Methods to called the like, favorite, camera, gallery, and comment buttons are pressed
        //Uses UILongPress's to notify of the taps
        let longLike = UILongPressGestureRecognizer(target: self, action: #selector(longL(_:)))
        longLike.minimumPressDuration = 0
        likeView.addGestureRecognizer(longLike)
        
        let longFav = UILongPressGestureRecognizer(target: self, action: #selector(longF(_:)))
        longFav.minimumPressDuration = 0
        favView.addGestureRecognizer(longFav)
        
        let longCom = UILongPressGestureRecognizer(target: self, action: #selector(longC(_:)))
        longCom.minimumPressDuration = 0
        comView.addGestureRecognizer(longCom)
        
        let longGallery = UILongPressGestureRecognizer(target: self, action: #selector(longGal(_:)))
        longGallery.minimumPressDuration = 0
        galleryView.addGestureRecognizer(longGallery)
        
        let longCamera = UILongPressGestureRecognizer(target: self, action: #selector(longCam(_:)))
        longCamera.minimumPressDuration = 0
        cameraView.addGestureRecognizer(longCamera)
        
        let longSend = UILongPressGestureRecognizer(target: self, action: #selector(send(_:)))
        longSend.minimumPressDuration = 0
        sendView.addGestureRecognizer(longSend)
    }
    
    //Needed to move the screen when the keyboard appears.
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //imports image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            tempImg = image
            hasImage = true
        }else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
        updateComments()
    }
    
    //When the camera button is pressed, pulls up the camera as well as shows visual feed back to the press
    @objc func longCam(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            cameraView.backgroundColor = white
            cameraView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        
        }
        else {
            cameraView.backgroundColor = granite
            cameraView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
    }
    
    //When the gallery button is pressed, pulls up the gallery
    @objc func longGal(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            galleryView.backgroundColor = white
            galleryView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
            self.present(image, animated: true)
        }
        else {
            galleryView.backgroundColor = granite
            galleryView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
        
    }
    
    //When the like button is pressed, tells the IssueClass to updates its like
    //Also changes the like icon to represent the right state
    @objc func longL(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            likeView.backgroundColor = white
            likeView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            myIssue.checkLiked(id: myIssue.getID(), nav: self.navigationController!)
            changeLikeOrFavoriteButton(button: likeButton, state: myIssue.getUpVoteState(), imageOne: UIImage(named: "filled heart"), imageTwo: UIImage(named: "heart-1"))
            likeButtonHandler?()
        }
            
        else {
            likeView.backgroundColor = granite
            likeView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
    }
    
    //When the favorite button is pressed, this method tells the IssueClass to updates it favorites
    //Also changes the appearence of the favorite button
    @objc func longF(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            favView.backgroundColor = white
            favView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            myIssue.checkFavorited(id: myIssue.getID(), nav: self.navigationController!)
            changeLikeOrFavoriteButton(button: favButton, state: myIssue.getFavoritesState(), imageOne: UIImage(named: "filled star"), imageTwo: UIImage(named: "star"))
            favButtonHandler?()
        }
        else {
            favView.backgroundColor = granite
            favView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
    //Since changing the appearance of the like or favorite button is done very similarly, this method is made to prevent repeated code
    fileprivate func changeLikeOrFavoriteButton(button: UIButton!, state: Bool, imageOne: UIImage?, imageTwo: UIImage?) {
        if (state){
            likeAndFavoriteAmountLabel.text = "\(myIssue.getUpVotes()) likes, \(myIssue.getFavorites()) favorites"
            button.setImage(imageOne, for: .normal)
        }else {
            likeAndFavoriteAmountLabel.text = "\(myIssue.getUpVotes()) likes, \(myIssue.getFavorites()) favorites"
            button.setImage(imageTwo, for: .normal)
        }
    }
    
    //When the comment is pressed, changes the view appearence
    @objc func longC(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            comView.backgroundColor = white
            comView.layer.shadowOffset = CGSize(width: -1, height: 1)
            commentTextField.becomeFirstResponder()
        }
        else {
            comView.backgroundColor = granite
            comView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
//    fileprivate func scrollToBottom() {
//        let indexPath = NSIndexPath(item: self.comments.count-1, section: 0)
//        self.commentView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.bottom, animated: false)
//    }

    //Gets the issue from the issueID passed from the feed, map, or account page, then changes the page to fit the new data
    func loadIssue() {
        let nav = self.navigationController!
        NetworkAPI().getIssueById(nav: nav, id: issueID) { issue,error in
            self.myIssue = issue
            self.issueLabel.text = issue.getTitle()
            self.descriptionLabel.text = issue.getDescription()
            self.issueImage.image = UIImage(named: issue.getIssueImage())
            self.locationLabel.text = issue.getLocation()
            self.profileImage.image = UIImage(named: "photo")
            self.timeLabel.text = issue.getIssueTime()
            self.dateLabel.text = issue.getIssueDate()
            self.userNameLabel.text = issue.myUserName
            self.profileImage.image = UIImage(named: issue.myUserImage)
            self.comments = issue.getListOfComments()
            
            for comment in issue.getListOfComments(){
                print(comment.myImage)
            }

            self.commentView.reloadData()
//            if self.comments.count > 0{
//                self.scrollToBottom()
//            }
            self.changeLikeOrFavoriteButton(button: self.likeButton, state: self.myIssue.getUpVoteState(), imageOne: UIImage(named: "filled heart"), imageTwo: UIImage(named: "heart-1"))
            self.changeLikeOrFavoriteButton(button: self.favButton, state: self.myIssue.getFavoritesState(), imageOne: UIImage(named: "filled star"), imageTwo: UIImage(named: "star"))
        }
        configureTapGesture()
    }
    
    @objc func send(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            sendView.backgroundColor = white
            sendView.layer.shadowOffset = CGSize(width: -1, height: 1)
            
            updateComments()
            commentTextField.resignFirstResponder()
            commentTextField.text = ""
            
        }
        else {
            sendView.backgroundColor = granite
            sendView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
    }
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(IssuePageController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(){
        view.endEditing(true)
    }
    
    //when a keyboard is brought up or dismissed, this method is called to handle moving the screen
    @objc func keyboardWillChange(notification: Notification){
        print("yes!")
        //Gets the CGRect that represents the size of the keyboard
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification  || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            //When the keyboard appears, this is the value that the screens needs to be shifted up by.
            view.frame.origin.y = -(keyboardRect.height - tabBarHeight - navBarHeight - statusBarHeight)
            print("showing")
        }else {
            //When the keyboard is dismissed, the height needs to be reset to this value.
            view.frame.origin.y = navBarHeight + statusBarHeight
        }
    }
    
    //When a new comment is submitted, this method adds it to the issue's list of comments, as well as places a new comment in the TableView
    func updateComments() {
        let nav = self.navigationController!
        if hasImage == true {
            NetworkAPI().uploadCommentImage(issueID: issueID, userID: myUser.getUserId(), commentImage: tempImg!) { stall in
                self.loadIssue()
            }
            hasImage = false
        }
        else {
            tempImg = UIImage()
            if commentTextField.hasText {
                myIssue.addComment(comment: commentTextField.text!, image: "none", issueId: myIssue.getID(), userId: myUser.getUserId(), user_name: myIssue.myUserName, user_image: myIssue.myUserImage, nav: self.navigationController!) { stall in
                     self.loadIssue()
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
//            self.loadIssue()
//        })
    }
    
    //Code to make the page start waiting for the keyboard to appear or dissappear
    func listenForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    //Configures the comment cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCommentCell", for: indexPath) as! textCommentCell
        comments = myIssue.getListOfComments()
        cell.commentLabel.text = comments[indexPath.row].myBody
        cell.userLabel.text = comments[indexPath.row].myUserName
        cell.commentUserImage.image = UIImage(named:comments[indexPath.row].myUserImage)
        
        print("pay attention to this")
        print(comments[indexPath.row].myImage)
        if(comments[indexPath.row].myImage != "none") {
            var url = NSURL(string: comments[indexPath.row].myImage)
        
            print(url)
            var data = NSData(contentsOf : url as! URL)
            var image = UIImage(data : data! as Data)
            cell.commentPic.image = image
        }
        else {
            cell.commentPic.image = UIImage()
        }
        return cell
    }
    
    @IBAction func tapCommentButton(_ sender: Any) {
        updateComments()
        view.endEditing(true)
    }
    
}
