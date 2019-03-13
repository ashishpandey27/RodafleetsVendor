//
//  AddDriverViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 01/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class AddDriverViewController: UIViewController {

    var datepicker : UIDatePicker?
    
     @IBOutlet weak var txtfieldExpiryDate: CustomTextfield!
     @IBOutlet weak var btnUploadDocuments: UIButton!
     @IBOutlet weak var txtfieldMobile: CustomTextfield!
    
     var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
//
//        datepicker = UIDatePicker()
//        datepicker?.datePickerMode = .date
//        datepicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
//
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
//
//        view.addGestureRecognizer(tapGesture)
//
//
//        txtfieldExpiryDate.inputView = datepicker
        
        
      
        
        
        
        
        
        
        
//
        
        // Do any additional setup after loading the view.
    }
    
//
//    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
//        view.endEditing(true)
//    }
//
//
//    @objc func dateChanged(datePicker: UIDatePicker) {
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//
//
//        txtfieldExpiryDate.text = dateFormatter.string(from: (datepicker?.date)!)
//        view.endEditing(true)
//
//
//        // Do any additional setup after loading the view.
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let maxLength = 10
        let currentString: NSString = txtfieldMobile.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    
    
    @IBAction func back_button_action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_uploadDocument_action(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let viewName:NSString = "DriverDocumentsViewController"
        let vc = storyboard.instantiateViewController(withIdentifier: viewName as String) as! DriverDocumentsViewController
        self.navigationController?.show(vc, sender: self);
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
