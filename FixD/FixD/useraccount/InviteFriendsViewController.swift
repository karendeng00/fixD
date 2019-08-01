//
//  InviteFriendsViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MessageUI

//Class corresponding to the Invite Friends Page.
class InviteFriendsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Send email button that opens up the Mail iOS cli
    @IBAction func sendButton(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else {
            showMailError()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Configures mail Controller from iOS CLi
    func configureMailController() -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients([emailField.text ?? "Add Recipients Here"])
        mailComposer.setSubject("Invitation to Download Fix'D App!")
        mailComposer.setMessageBody("Your friend is inviting you to Download Fix'D App! Be able to report any issue on Duke Campus Now!", isHTML: false)
        
        return mailComposer
        
    }
    
    //Returns an error if mail could not be configured.
    func showMailError() {
        let sendMailError = UIAlertController(title: "Could not send email", message: "Please try again later.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailError.addAction(dismiss)
        self.present(sendMailError, animated:true, completion:nil)
    }
    
    //Closes the mail iOS Cli
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }

}
