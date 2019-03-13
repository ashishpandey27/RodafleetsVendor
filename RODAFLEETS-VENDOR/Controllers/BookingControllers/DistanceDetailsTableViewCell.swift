//
//  DistanceSetailsTableViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class DistanceDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageORIGIN: UIImageView!
    @IBOutlet weak var imageDestination: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageORIGIN.layer.masksToBounds = false
        imageORIGIN.layer.cornerRadius = imageORIGIN.frame.height/2
        imageORIGIN.clipsToBounds = true
        
        imageDestination.layer.masksToBounds = false
        imageDestination.layer.cornerRadius = imageDestination.frame.height/2
        imageDestination.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


