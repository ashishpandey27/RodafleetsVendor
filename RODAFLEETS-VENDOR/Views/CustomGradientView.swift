//
//  CustomGradientView.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 19/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation

import UIKit

class CustomGradientView: UIView {
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        abc()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        abc()
        
    }
    
    func abc() {
        
        self.layer.cornerRadius = 12.0
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius  = 2
        self.layer.masksToBounds = false
}




}
