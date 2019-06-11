//
//  InviteFriendsViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit
import MessageUI

class InviteFriendsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["amezap12@gmail.com"])
        mailComposer.setSubject("Invitation to Download Fix'D App!")
        mailComposer.setMessageBody("Your friend is inviting you to Download Fix'D App! Be able to report any issue on Duke Campus Now!", isHTML: false)
        
        return mailComposer
        
    }
    
    func showMailError() {
        let sendMailError = UIAlertController(title: "Could not send email", message: "Your device could not send email. Please try again later.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailError.addAction(dismiss)
        self.present(sendMailError, animated:true, completion:nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true, completion: nil)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
