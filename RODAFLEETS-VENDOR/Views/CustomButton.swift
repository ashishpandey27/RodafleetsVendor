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
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
            shadowLayer.fillColor = UIColor(displayP3Red: 252/255, green: 154/255, blue: 2/255, alpha: 1.0).cgColor
            
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 3.0, height: 3.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, at: 0)
            // layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
}


