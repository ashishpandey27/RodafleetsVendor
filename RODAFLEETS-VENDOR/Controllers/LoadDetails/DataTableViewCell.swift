//
//  DataTableViewCell.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBase: UIView!
    @IBOutlet weak var imageTo: UIImageView!
    @IBOutlet weak var viewBaseTop: UIView!
    @IBOutlet weak var imageFrom: UIImageView!
    
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var viewStar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        imageFrom.layer.masksToBounds = false
        imageFrom.layer.cornerRadius = imageFrom.frame.height/2
        imageFrom.clipsToBounds = true
        
        imageTo.layer.masksToBounds = false
        imageTo.layer.cornerRadius = imageTo.frame.height/2
        imageTo.clipsToBounds = true
        
        viewStar.layer.borderWidth = 0.5
        viewStar.layer.borderColor = UIColor.darkGray.cgColor
       // viewStar.layer.cornerRadius = 8.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
