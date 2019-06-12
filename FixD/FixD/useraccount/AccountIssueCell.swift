//
//  AccountIssueCell.swift
//  FixD
//
//  Created by Ann Bailey on 6/11/19.
//  Copyright © 2019 Duke. All rights reserved.
//

import UIKit

class AccountIssueCell: UITableViewCell {

    
    @IBOutlet weak var accountCellMyImage: UIImageView!
    @IBOutlet weak var accountCellMyName: UILabel!
    @IBOutlet weak var accountCellStar: UIImageView!
    @IBOutlet weak var accountCellUpVote: UIImageView!
    @IBOutlet weak var accountCellComment: UIImageView!
    @IBOutlet weak var accountCellIssueImage: UIImageView!
    @IBOutlet weak var accountCellLocationPin: UIImageView!
    @IBOutlet weak var accountCellLocation: UILabel!
    @IBOutlet weak var accountCellDescription: UILabel!
    @IBOutlet weak var accountCellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
