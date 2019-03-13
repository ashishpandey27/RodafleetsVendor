//
//  CustomViewImage.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 28/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit

class CustomViewImage: UIView {
    
    override func draw(_ rect: CGRect) {
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 205/255, green: 206/255, blue: 207/255, alpha: 1.0).cgColor
        self.layer.cornerRadius = 6.0
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
    }
}


