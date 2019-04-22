//
//  ForgotPasswordViewController.swift
//  RodafleetsVendor
//
//  Created by Developer on 17/04/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var btnGetPassword: UIButton!
    @IBOutlet weak var txtfieldForgot: CustomTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnGetPassword.isEnabled = false
        btnGetPassword.backgroundColor = UIColor(red: 250/255, green: 179/255, blue: 22/255, alpha: 0.5)
        txtfieldForgot.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 250/255, green: 154/255, blue: 0/255, alpha: 1.0)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 250/255, green: 154/255, blue: 0/255, alpha: 1.0)
        
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if (txtfieldForgot.text?.isEmpty)!  {
            
            btnGetPassword.isEnabled = false
            btnGetPassword.backgroundColor = UIColor(red: 250/255, green: 154/255, blue: 0/255, alpha: 0.5)
        } else {
            //Enable button
            btnGetPassword.isEnabled = true
            btnGetPassword.backgroundColor = UIColor(red: 250/255, green: 154/255, blue: 0/255, alpha: 1.0)
        }
    }
    
    @IBAction func btn_get_password_action(_ sender: Any) {
        btnGetPassword.tag = 17
        CONSTANTVARIABLES.tag = btnGetPassword.tag
        params()
        
    }
    @IBAction func back_btn_action(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func params() {
        
        let dict = NSMutableDictionary()
        dict.setValue(txtfieldForgot.text, forKey: "mobile_no")
        CONSTANTVARIABLES.mobile = txtfieldForgot.text!
        
        callForgotPasswordAPI(parameters: dict)
    }
    
    
    
    
    func callForgotPasswordAPI(parameters : NSDictionary) {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_FORGOT_PASSWORD)
        let headers = ["Authorization" : "Bearer "+CONSTANTVARIABLES.token+"",
                       "Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: headers ).responseJSON {  (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                SVProgressHUD.show()
                if response.result.value != nil {
                    SVProgressHUD.dismiss()
                    let json = response.result.value as! NSDictionary
                    print(json)
                    
                    let err = json.value(forKey: "error") as! Bool
                    if err == false {
                        let data = json.value(forKey: "data") as! NSDictionary
                        
                        
                        MyUtility.showController(selfController: self, storyboard: StoryboardName.Main, identifier: ViewIdentifiers.VerifyMobile)
                    }else {
                        let msg = json.value(forKey: "message") as! NSString
                        MyUtility.showAlert("ALert", "\(msg)" as NSString, controller: self)
                    }
                    
                }
                
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
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
    
}

