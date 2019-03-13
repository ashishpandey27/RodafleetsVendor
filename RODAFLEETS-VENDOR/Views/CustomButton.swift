//
//  CustomButton.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 05/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        applyDesign()
    }
    func applyDesign() {
        
        self.backgroundColor = UIColor(displayP3Red: 250/255, green: 181/255, blue: 23/255, alpha: 1.0)
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.titleLabel?.font = UIFont(name: "bahnschrift", size: 15.0)
        self.setTitle(self.titleLabel?.text?.uppercased(), for: UIControl.State.normal)
      
    }
}
