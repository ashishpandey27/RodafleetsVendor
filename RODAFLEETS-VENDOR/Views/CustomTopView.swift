//
//  CustomTopView.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//


import UIKit

class CustomTopView: UIView {
    
     var shadowLayer: CAShapeLayer!
     var cornerRadius: CGFloat = 0.0
      var fillColor: UIColor = .white
    var fillcolor1 : UIColor = .green
    // the color applied to the shadowLayer, rather than the view's backgroundColor
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            
            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
}



