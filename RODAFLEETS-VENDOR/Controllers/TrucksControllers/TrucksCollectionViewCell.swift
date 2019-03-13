//
//  TrucksCollectionViewCell.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 24/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class TrucksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblData: UILabel!
    override func awakeFromNib() {
      
    }
    
    override var isSelected : Bool {
        didSet {
            lblData.textColor = isSelected ? UIColor.white : UIColor.black
        }
    }

   
    
}

