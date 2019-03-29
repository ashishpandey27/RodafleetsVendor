//
//  SignUPViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUPViewController: UIViewController, UITextFieldDelegate {
    
    
    let pop = PopUpViewController()
    
    var count: Int = 0
    @IBOutlet weak var txtfieldFullName: CustomTextfield!
    @IBOutlet weak var txtfieldEmail: CustomTextfield!
    @IBOutlet weak var txtfieldMobile: CustomTextfield!
    @IBOutlet weak var txtfieldPassword: CustomTextfield!
    @IBOutlet weak var txtfieldPan: CustomTextfield!
    @IBOutlet weak var txtfieldAadhar: CustomTextfield!
    @IBOutlet weak var txtfieldGStin: CustomTextfield!
    @IBOutlet weak var txtfieldCompany: CustomTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        print(UIDevice.current.identifierForVendor!.uuidString)
    }
    
    
    
    @IBAction func btn_signUP_action(_ sender: Any) {
        
        SVProgressHUD.show()
        Service.sharedInstance.fetchSignUp(param:parameters()) {(SignUpDataFetched) in
            
            if SignUpDataFetched.signUpData.error == false {
                SVProgressHUD.dismiss()
                print("success")
                
                MyUtility.showController(selfController: self, storyboard: StoryboardName.Main, identifier: ViewIdentifiers.VerifyMobile)
                
                print("\(SignUpDataFetched.signUpData.mobile_no)")
                CONSTANTVARIABLES.name =  SignUpDataFetched.signUpData.name
                CONSTANTVARIABLES.mobile =  SignUpDataFetched.signUpData.mobile_no
                print(CONSTANTVARIABLES.mobile)
                print(SignUpDataFetched.signUpData.otp)
                
            }else {
                print("no data")
                SVProgressHUD.dismiss()
                MyUtility.showAlert("Alert", "\(SignUpDataFetched.signUpData.message)" as NSString, controller: self)
            }
        }
    }
    
    func parameters()->NSMutableDictionary{
        let dict = NSMutableDictionary()
        
        
        if CONSTANTVARIABLES.type == 2 {
            dict.setValue(txtfieldFullName.text!, forKey: "name")
            dict.setValue(txtfieldEmail.text!,    forKey: "email" )
            dict.setValue(txtfieldMobile.text!,   forKey: "mobile_no")
            dict.setValue(txtfieldPassword.text!, forKey: "password")
            dict.setValue(txtfieldPan.text!,      forKey: "pan")
            dict.setValue(txtfieldAadhar.text!,   forKey: "aadhar")
            dict.setValue(UIDevice.current.identifierForVendor!.uuidString,                      forKey: "device_id")
            dict.setValue("ios",                  forKey: "device_type")
            dict.setValue("token",                forKey: "device_token")
            dict.setValue(CONSTANTVARIABLES.type, forKey: "type")
        } else if CONSTANTVARIABLES.type == 3 {
            
            dict.setValue(txtfieldFullName.text!, forKey: "name")
            dict.setValue(txtfieldEmail.text!,    forKey: "email" )
            dict.setValue(txtfieldMobile.text!,   forKey: "mobile_no")
            dict.setValue(txtfieldPassword.text!, forKey: "password")
            dict.setValue(txtfieldPan.text!,      forKey: "pan")
            dict.setValue(txtfieldAadhar.text!,   forKey: "aadhar")
            dict.setValue(UIDevice.current.identifierForVendor!.uuidString,                      forKey: "device_id")
            dict.setValue("ios",                  forKey: "device_type")
            dict.setValue("token",                forKey: "device_token")
            dict.setValue(CONSTANTVARIABLES.type, forKey: "type")
            dict.setValue(txtfieldCompany.text,                   forKey: "company")
            dict.setValue(txtfieldGStin.text,     forKey: "gstin")
        } else {
            
            dict.setValue(txtfieldFullName.text!, forKey: "name")
            dict.setValue(txtfieldEmail.text!,    forKey: "email" )
            dict.setValue(txtfieldMobile.text!,   forKey: "mobile_no")
            dict.setValue(txtfieldPassword.text!, forKey: "password")
            dict.setValue(txtfieldPan.text!,      forKey: "pan")
            dict.setValue(txtfieldAadhar.text!,   forKey: "aadhar")
            dict.setValue(UIDevice.current.identifierForVendor!.uuidString,                      forKey: "device_id")
            dict.setValue("ios",                  forKey: "device_type")
            dict.setValue("token",                forKey: "device_token")
            dict.setValue(2, forKey: "type")
        }
        
        return dict
    }
    
    func loadTextfield(){
        
        switch count {
        case 3:
            txtfieldCompany.isHidden = false
            txtfieldGStin.isHidden = false
        case 2:
            txtfieldCompany.isHidden = true
            txtfieldGStin.isHidden = true
        default:
            break
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
