//
//  OITredoViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/26/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import iOSDropDown

class OITredoViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var urgencyDropDown: DropDown!
    @IBOutlet weak var impactDropDown: DropDown!
    @IBOutlet weak var sensitiveInfo: UITextView!
    @IBOutlet weak var attachementPic: UIImageView!
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var galleryView: UIView!
    @IBOutlet var views: [UIView]!
    
    let white = UIColor(cgColor: CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])!)
    let granite = UIColor(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 0.5)
    
    var myIssue:IssueClass = IssueClass()
    var tempImg: UIImage?
    var hasImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urgencyDropDown.optionArray = ["Low", "Medium", "High"]
        impactDropDown.optionArray = ["Individual", "Work Group", "Widespread"]
        
        urgencyDropDown.text = "Please select"
        impactDropDown.text = "Please select"
        
        sensitiveInfo.text = "Enter any PHI or other sensitive information in this field."
        
        //sets up UI features for the camera and gallery buttons
        for v in views {
            v.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.8])
            v.layer.masksToBounds = false
            v.layer.cornerRadius = 2.0
            v.layer.shadowOffset = CGSize(width: -1.5, height: 1.5)
            v.layer.shadowOpacity = 0.22
        }
        
        //gesture recognizer for gallery button
        let longGallery = UILongPressGestureRecognizer(target: self, action: #selector(longGal(_:)))
        longGallery.minimumPressDuration = 0
        galleryView.addGestureRecognizer(longGallery)
        
        //gesture recognizer for camera button
        let longCamera = UILongPressGestureRecognizer(target: self, action: #selector(longCam(_:)))
        longCamera.minimumPressDuration = 0
        cameraView.addGestureRecognizer(longCamera)
        
        //because urgency and impact only have three options each, the search functionality of the drop down menu is disabled
        urgencyDropDown.isSearchEnable = false
        impactDropDown.isSearchEnable = false
        
    }
    
    //checks to make sure that all required fields are filled in and calls createAlert if not
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let nav = self.navigationController!
        if urgencyDropDown.text != "Please select" && impactDropDown.text != "Please select" {
            myIssue.defineServiceNowParams(urgency: urgencyDropDown.text!, impact: impactDropDown.text!, sensitive_info: sensitiveInfo.text!)
            NetworkAPI().buildIssue(issue: myIssue, nav: nav)
            return true
        }
        createAlert(title: "Selections Missing", message: "Please fill in missing selections.")
        return false
    }
    
    //creates an alert if the user has left any required fields blank
    func createAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        sensitiveInfo.text = ""
    }
    
    //imports image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            tempImg = image
            hasImage = true
        }
        else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
        attachementPic.image = tempImg
    }
    
    //delegates what happens if the user presses the camera button
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
    
    //delegates what happens if the user presses the gallery button
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
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OITredoViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(){
        view.endEditing(true)
    }
}
