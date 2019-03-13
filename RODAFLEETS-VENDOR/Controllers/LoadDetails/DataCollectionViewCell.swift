//
//  DataCollectionViewCell.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblTruckType: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    override func awakeFromNib() {
        
    }
    
}
