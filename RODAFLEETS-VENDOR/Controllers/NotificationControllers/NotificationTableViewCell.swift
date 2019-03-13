//
//  NotificationTableViewCell.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 06/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNotificationMsg: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
