//
//  CustomTextfield.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 28/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit

class CustomTextfield: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        designTextfield()
        setLeftPadding(5)
        setBackgroundColor()
    }

    func designTextfield() {
        
        self.layer.borderColor = UIColor(red: 135/255, green: 136/255, blue: 136/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        
    }
    
    func setBackgroundColor() {
        self.layer.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
    }
    
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
