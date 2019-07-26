//
//  IssuePageController.swift
//  FixD
//
//  Created by Duc Tran on 6/10/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

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
    var images:[UIImage] = []
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
    var feedScrollHandler:(() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollHandler?()
        
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
    
    fileprivate func changeLikeOrFavoriteButton(button: UIButton!, state: Bool, imageOne: UIImage?, imageTwo: UIImage?) {
        if (state){
            likeAndFavoriteAmountLabel.text = "\(myIssue.getUpVotes()) likes, \(myIssue.getFavorites()) favorites"
            button.setImage(imageOne, for: .normal)
        }else {
            likeAndFavoriteAmountLabel.text = "\(myIssue.getUpVotes()) likes, \(myIssue.getFavorites()) favorites"
            button.setImage(imageTwo, for: .normal)
        }
    }
    
    @objc func longC(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            comView.backgroundColor = white
            comView.layer.shadowOffset = CGSize(width: -1, height: 1)
        }
        else {
            comView.backgroundColor = granite
            comView.layer.shadowOffset = CGSize(width: -10, height: 10)
        }
        
    }
    
    fileprivate func scrollToBottom() {
        let indexPath = NSIndexPath(item: self.comments.count-1, section: 0)
        self.commentView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.bottom, animated: false)
    }
    
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
            self.commentView.reloadData()
            if self.comments.count > 0{
                self.scrollToBottom()
            }
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
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification  || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            //When the keyboard appears, this is the value that the screens needs to be shifted up by.
            view.frame.origin.y = -(keyboardRect.height - tabBarHeight - navBarHeight - statusBarHeight)
        }else {
            //When the keyboard is dismissed, the height needs to be reset to this value.
            view.frame.origin.y = navBarHeight + statusBarHeight
        }
    }
    
    func updateComments() {
        let nav = self.navigationController!
        if hasImage == true {
            myIssue.addImage(image: tempImg!)
            upload()
            
            hasImage = false
        }
        else {
            tempImg = UIImage()
            myIssue.addImage(image: tempImg!)
        }   
        
        if commentTextField.hasText {
            myIssue.addComment(comment: commentTextField.text!, image: tempImg! , issueId: myIssue.getID(), userId: myUser.getUserId(), user_name: myUser.getUserName(), user_image: myUser.getUserImage(), nav: nav)
        }
        else {
            myIssue.addComment(comment: "", image: tempImg! , issueId: myIssue.getID(), userId: myUser.getUserId(), user_name: myUser.getUserName(), user_image: myUser.getUserImage(), nav: nav)
        }
        
        commentTextField.text = ""
        comments = myIssue.getListOfComments()
        images = myIssue.getListOfImages()
        commentView.reloadData()
        scrollToBottom()
    }
    
    //Methods to listen for when the keyboard is called
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCommentCell", for: indexPath) as! textCommentCell
        cell.commentLabel.text = comments[indexPath.row].myBody
        cell.userLabel.text = comments[indexPath.row].myUserName
        cell.commentUserImage.image = UIImage(named:comments[indexPath.row].myUserImage)
        
//        var url = NSURL(string: "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDRG9JYTJWNVNTSWRSMkZDV2pGUmRWTk5WbU5GYUhSeFdXTlRVR2M1WldKUkJqb0dSVlE2RUdScGMzQnZjMmwwYVc5dVNTSS9hVzVzYVc1bE95Qm1hV3hsYm1GdFpUMGlZWFpoZEdGeUxuQnVaeUk3SUdacGJHVnVZVzFsS2oxVlZFWXRPQ2NuWVhaaGRHRnlMbkJ1WndZN0JsUTZFV052Ym5SbGJuUmZkSGx3WlVraURtbHRZV2RsTDNCdVp3WTdCbFE9IiwiZXhwIjoiMjAxOS0wNy0yMlQyMDo1MDozMS44NDlaIiwicHVyIjoiYmxvYl9rZXkifX0=--1103502ecbc56431d1d5207ed1e87ea740282044/avatar.png?content_type=image%2Fpng&disposition=inline%3B+filename%3D%22avatar.png%22%3B+filename%2A%3DUTF-8%27%27avatar.png")
//        
//        var data = NSData(contentsOf : url as! URL)
//        var image = UIImage(data : data! as Data)
//        cell.commentPic.image = image
        return cell
    }
    
    @IBAction func tapCommentButton(_ sender: Any) {
        updateComments()
        view.endEditing(true)
    }
    
    
    
    func upload() {
        guard let image = tempImg else { return  }
        
        let filename = "avatar.png"
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString

        let comment = ["body": "This is the body",
                       "issue_id": myIssue.getID(),
                       "user_id": myIssue.getUserId()] as [String : Any]
        var parameters = [[String: Any]]()
        parameters.append(comment)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: URL(string: "https://fixd-test.cloud.duke.edu/comments")!)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the reqtype field and its value to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[body]\"\r\n\r\n".data(using: .utf8)!)
        data.append("This is the body".data(using: .utf8)!)
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[avatar]\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[issue_id]\"\r\n\r\n".data(using: .utf8)!)
        data.append("1".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"comment[user_id]\"\r\n\r\n".data(using: .utf8)!)
        data.append("1".data(using: .utf8)!)
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"commit\"\r\n\r\n".data(using: .utf8)!)
        data.append("Save Comment".data(using: .utf8)!)
        
        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                print("\(error!.localizedDescription)")
            }
            
            guard let responseData = responseData else {
                print("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                print("uploaded to: \(responseString)")

            }
        
            
        }).resume()
    }
    
}
