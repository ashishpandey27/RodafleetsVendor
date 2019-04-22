//
//  DatePicker.swift
//  RodafleetsVendor
//
//  Created by Developer on 09/04/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit

class DatePicker: UITextField {
    
    override func draw(_ rect: CGRect) {
        designTextfield()
        setLeftPadding(5)
        setBackgroundColor()
    }
    
    
    lazy var datePicker : UIDatePicker = {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    lazy var toolbar : UIToolbar = {
        
        let toolbar = UIToolbar()
        let btnDONE = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let btnSPACE = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let btnCANCEL = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([btnDONE,btnSPACE,btnCANCEL], animated: false)
        toolbar.sizeToFit()
        return toolbar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addDatePicker()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
        addDatePicker()
    }
    
    
    func addDatePicker() {
        inputAccessoryView = toolbar
        inputView = datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        text = formatter.string(from: datePicker.date)
        endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        endEditing(true)
    }
    
    func designTextfield() {
        
        self.layer.borderColor = UIColor(red: 135/255, green: 136/255, blue: 136/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        self.clipsToBounds = true
        // self.layer.cornerRadius = 5.0
        
    }
    
    func setBackgroundColor() {
        self.layer.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
    }
    
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
}



