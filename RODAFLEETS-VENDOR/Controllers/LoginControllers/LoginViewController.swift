//
//  LoginViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//


import UIKit
import SVProgressHUD

class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var txtFieldEmailORnumber: CustomTextfield!
    
    @IBOutlet weak var txtfieldPassword: CustomTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtFieldEmailORnumber.delegate = self
    }
    
    @IBAction func btn_login_action(_ sender: Any) {
        
        SVProgressHUD.show()
        Service.sharedInstance.fetchLogin(param: param()) { (LoginDataFetched) in
            
            if LoginDataFetched.loginData.error == false {
                SVProgressHUD.dismiss()
                print("Login Succefully")
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.login()
            } else {
                
                print("no data")
                SVProgressHUD.dismiss()
                MyUtility.showAlert("Alert", "\(LoginDataFetched.loginData.message)" as NSString, controller: self)
            }
        }
    }
    
    
    func param() -> NSMutableDictionary {
        
        if (txtFieldEmailORnumber.textContentType == UITextContentType.telephoneNumber) {
            let dict = NSMutableDictionary()
            
            dict.setValue(txtFieldEmailORnumber.text, forKey: "mobile_no")
            dict.setValue(txtfieldPassword.text,      forKey: "password")
            dict.setValue(UIDevice.current.identifierForVendor!.uuidString,                          forKey: "device_id")
            dict.setValue("ios",                      forKey: "device_type")
            dict.setValue("token",                    forKey: "device_token")
            dict.setValue(CONSTANTVARIABLES.type,     forKey: "type")
            
            
            return dict
            
        } else {
            let dict = NSMutableDictionary()
            
            dict.setValue(txtFieldEmailORnumber.text, forKey: "email")
            dict.setValue(txtfieldPassword.text,      forKey: "password")
            dict.setValue(UIDevice.current.identifierForVendor!.uuidString,                          forKey: "device_id")
            dict.setValue("ios",                      forKey: "device_type")
            dict.setValue("token",                    forKey: "device_token")
            dict.setValue(CONSTANTVARIABLES.type,     forKey: "type")
            
            return dict
            
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
    
}
