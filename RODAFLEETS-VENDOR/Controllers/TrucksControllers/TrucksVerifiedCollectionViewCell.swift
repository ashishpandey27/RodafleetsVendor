//
//  VerifiedCollectionViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class TrucksVerifiedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var imageAvailable: UIImageView!
    @IBOutlet weak var viewAvailability: UIView!
    
    
    override func awakeFromNib() {
        
        imageAvailable.layer.cornerRadius = imageAvailable.frame.height/2
        imageAvailable.clipsToBounds = true
        
        
    }
    
}
