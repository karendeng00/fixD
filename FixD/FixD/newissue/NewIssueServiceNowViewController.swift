//
//  NewIssueServiceNowViewController.swift
//  FixD
//
//  Created by Alejandro Meza on 6/12/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class NewIssueServiceNowViewController: UIViewController {

    @IBOutlet weak var urgencySlider: UISlider!
    
    @IBOutlet weak var impactControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderMoved(sender: UISlider) { sender.setValue(Float(lroundf(urgencySlider.value)), animated: true)
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
