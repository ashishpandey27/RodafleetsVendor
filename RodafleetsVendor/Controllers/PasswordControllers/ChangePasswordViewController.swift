//
//  CurrentPasswordViewController.swift
//  RodafleetsVendor
//
//  Created by Developer on 18/04/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var lblOldPassword: UILabel!
    @IBOutlet weak var txtfieldOldPassword: CustomTextfield!
    
    @IBOutlet weak var txtfieldNewPassword: CustomTextfieldLogin!
    @IBOutlet weak var txtfieldConfirmPassword: CustomTextfieldLogin!
    @IBOutlet weak var btnUpdatePwd: UIButton!
    
    @IBOutlet weak var constraintLblNewpwd: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfieldOldPassword.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txtfieldNewPassword.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txtfieldConfirmPassword.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        btnUpdatePwd.isEnabled = false
        btnUpdatePwd.backgroundColor = UIColor(red: 250/255, green: 154/255, blue: 0/255, alpha: 0.5)
        
        setUpUIfields()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 250/255, green: 154/255, blue: 0/255, alpha: 1.0)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 250/255, green: 154/255, blue: 0/255, alpha: 1.0)
    }
    
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if CONSTANTVARIABLES.tag == 17 {
            if (txtfieldNewPassword.text?.isEmpty)!  || (txtfieldConfirmPassword.text?.isEmpty)! {
                
                btnUpdatePwd.isEnabled = false
                btnUpdatePwd.backgroundColor = UIColor(red: 250/255, green: 179/255, blue: 22/255, alpha: 0.5)
                
            } else {
                //Enable button
                
                btnUpdatePwd.isEnabled = true
                btnUpdatePwd.backgroundColor = UIColor(red: 250/255, green: 179/255, blue: 22/255, alpha: 1.0)
            }
        } else {
            
            if (txtfieldOldPassword.text?.isEmpty)! || (txtfieldNewPassword.text?.isEmpty)! || (txtfieldConfirmPassword.text?.isEmpty)! {
                
                btnUpdatePwd.isEnabled = false
                btnUpdatePwd.backgroundColor = UIColor(red: 250/255, green: 179/255, blue: 22/255, alpha: 0.5)
                
            } else {
                //Enable button
                
                btnUpdatePwd.isEnabled = true
                btnUpdatePwd.backgroundColor = UIColor(red: 250/255, green: 179/255, blue: 22/255, alpha: 1.0)
            }
            
        }
    }
    
    
    func setUpUIfields() {
        
        if CONSTANTVARIABLES.tag == 17 {
            lblOldPassword.isHidden = true
            txtfieldOldPassword.isHidden = true
            constraintLblNewpwd.constant = -60
        }
        
        
        if CONSTANTVARIABLES.tag == 18 {
            lblOldPassword.isHidden = false
            txtfieldOldPassword.isHidden = false
            constraintLblNewpwd.constant = 20
        }
    }
    
    
    @IBAction func btn_update_passwrd_action(_ sender: Any) {
        
        if txtfieldNewPassword.text == txtfieldConfirmPassword.text {
            
            params()
        } else {
            MyUtility.showAlert("Alert", "Passwords do not match", controller: self)
        }
    }
    
    @IBAction func btn_back_action(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    func isPwdLength(password: String, confirmPassword : String ) -> Bool {
        
        if password.characters.count <= 7 && confirmPassword.characters.count <= 7{
            return true
        }else{
            MyUtility.showAlert("Alert", "Password length should be greter than 7 ", controller: self)
            return false
        }
        
    }
    
    func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }else{
            MyUtility.showAlert("Alert", "Password do not match", controller: self)
            return false
        }
    }
    
    
    func params() {
        
        let dict = NSMutableDictionary()
        
        dict.setValue(txtfieldNewPassword.text, forKey: "password")
        callChangePasswordAPI(parameters: dict)
    }
    
    
    func callChangePasswordAPI(parameters : NSDictionary) {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_UPDATE_CUSTOMER_PROFILE)
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
                    
                    MyUtility.showController(selfController: self, storyboard: StoryboardName.Main, identifier: ViewIdentifiers.Main)
                }
                
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
            }
        }
    }
    
    
    
}

