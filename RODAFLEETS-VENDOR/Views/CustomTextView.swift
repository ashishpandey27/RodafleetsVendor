//
//  CustomTextView.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 28/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit

class CustomTextView: UITextView {
    
    
    override func draw(_ rect: CGRect) {
       
        designTextView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textContainerInset = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 4)
    }
    
    func designTextView() {
        self.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
         self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        
    }
    
   
    
}
