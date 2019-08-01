//
//  SettingsTableViewCell.swift
//  FixD
//
//  Created by Ann Bailey on 6/6/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

//Class that corresponds to the cells of the settings table
class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
