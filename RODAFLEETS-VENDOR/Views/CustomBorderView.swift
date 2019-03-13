//
//  BorderViews.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class CustomBorderView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyDesign()
    }
    
    func applyDesign() {
        
        self.layer.cornerRadius = 8.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
    
    

