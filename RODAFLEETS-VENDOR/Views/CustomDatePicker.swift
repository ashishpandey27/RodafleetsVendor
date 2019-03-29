//
//  CustomDatePicker.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 27/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit
class CustomDatePicker: UITextField {
    
    private let _inputView: UIView? = {
        let picker = UIDatePicker()
        return picker
    }()
    
    private let _inputAccessoryToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        return toolBar
    }()
    
//    override var isUserInteractionEnabled: Bool {
//        return true
//    }
    
   // var inputView: UIView? {
  //      return _inputView
  //  }
    
  //  var inputAccessoryView: UIView? {
  //      return _inputAccessoryToolbar
  //  }
    
    required init() {
        super.init(frame: CGRect.zero)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        _inputAccessoryToolbar.setItems([ spaceButton, doneButton], animated: false)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(launchPicker))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc private func launchPicker() {
        becomeFirstResponder()
    }
    
    @objc private func doneClick() {
        resignFirstResponder()
    }
}
