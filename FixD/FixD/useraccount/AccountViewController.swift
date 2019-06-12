//
//  AccountViewController.swift
//  FixD
//
//  Created by Ann Bailey on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var myAccountPosition: UILabel!
    @IBOutlet weak var myAccountName: UILabel!
    @IBOutlet weak var myAccountImage: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAccountImage.image = UIImage(named:"blue devil.jpg")
        //myAccountName.text = UILabel
        //myAccountPosition.text = UILabel
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
