//
//  VerifiedTableViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class VerifiedTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var imageAvailable: UIImageView!
    @IBOutlet weak var viewAvailability: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageAvailable.layer.cornerRadius = imageAvailable.frame.height/2
        imageAvailable.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
