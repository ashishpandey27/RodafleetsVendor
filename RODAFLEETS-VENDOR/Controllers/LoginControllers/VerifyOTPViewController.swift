//
//  VerifyOTPViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import SVProgressHUD

class VerifyOTPViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lblMobile: UILabel!
    
    @IBOutlet weak var txtfieldOTP: CustomTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfieldOTP.defaultTextAttributes.updateValue(10.0, forKey: NSAttributedString.Key.kern)
        lblMobile.text =  "Verifying +91-\(String(CONSTANTVARIABLES.mobile))"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 250/255, green: 181/255, blue: 23/255, alpha: 1.0)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    }
    
    
    // textfield delegate method
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 5
        let currentString: NSString = txtfieldOTP.text as! NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    // Verify OTP API methods
    
    func parameters()->NSMutableDictionary{
        
        let dict = NSMutableDictionary()
        dict.setValue(txtfieldOTP.text,                 forKey: "otp")
        dict.setValue("\(CONSTANTVARIABLES.mobile)",    forKey: "mobile_no" )
        
        return dict
    }
    
    @IBAction func verify_otp_action(_ sender: Any) {
        
        SVProgressHUD.show()
        Service.sharedInstance.fetchOTP(param: parameters()) { (VerifyMobileDataFeteched) in
            
            if VerifyMobileDataFeteched.verifyMobileData.error == false {
                print("Success")
                SVProgressHUD.dismiss()
                print("\(VerifyMobileDataFeteched.verifyMobileData.token)")
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.login()
                
            } else {
                
                print("no data")
                SVProgressHUD.dismiss()
                MyUtility.showAlert("Alert", "\(VerifyMobileDataFeteched.verifyMobileData.message)" as NSString, controller: self)
            }
        }
    }
    
  
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */





