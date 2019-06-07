//
//  ViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/5/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dukeImage: UIImageView!
    @IBOutlet weak var fixdLogoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dukeImage.image = UIImage(named:"duke.png")
        fixdLogoImage.image = UIImage(named:"gears.png")
    }


}

