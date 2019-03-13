//
//  BookingTableViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var imageORIGIN: UIImageView!
    @IBOutlet weak var imageDestination: UIImageView!
  
    
    @IBOutlet weak var viewStar: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageORIGIN.layer.masksToBounds = false
        imageORIGIN.layer.cornerRadius = imageORIGIN.frame.height/2
        imageORIGIN.clipsToBounds = true
        
        imageDestination.layer.masksToBounds = false
        imageDestination.layer.cornerRadius = imageDestination.frame.height/2
        imageDestination.clipsToBounds = true
        
        
        viewStar.layer.cornerRadius = 6.0
        viewStar.clipsToBounds = true
        viewBase.layer.borderColor = UIColor.lightGray.cgColor
        viewStar.layer.borderWidth = 0.5
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


