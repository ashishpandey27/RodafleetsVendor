//
//  AddTruckViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 25/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class AddTruckViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    var datePicker : UIDatePicker!
   
    
    @IBOutlet weak var txtfieldFullName: CustomTextfield!
    @IBOutlet weak var txtViewAddress: CustomTextView!
    @IBOutlet weak var txtfieldCity: CustomTextfield!
    @IBOutlet weak var txtfieldState: CustomTextfield!
    @IBOutlet weak var txtfieldPinCode: CustomTextfield!
    @IBOutlet weak var txtfieldMobile: CustomTextfield!
    @IBOutlet weak var txtfieldAadhar: CustomTextfield!
    @IBOutlet weak var txtfieldPanNumber: CustomTextfield!
    
    @IBOutlet weak var txtfieldVehicleType: CustomTextfield!
    @IBOutlet weak var txtfieldLoadCapacity: CustomTextfield!
    @IBOutlet weak var txtfieldNumberOfTyres: CustomTextfield!
    
    @IBOutlet weak var txtfieldFitness: CustomTextfield!
    
    @IBOutlet weak var viewServiceAreas: UIView!
    @IBOutlet weak var btnUploadDocuments: UIButton!
    @IBOutlet weak var txtfieldInsurance: CustomTextfield!
   
    
    var datepicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewServiceAreas.layer.borderWidth = 0.5
        viewServiceAreas.layer.borderColor = UIColor.lightGray.cgColor
        viewServiceAreas.layer.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        viewServiceAreas.layer.cornerRadius = 5.0
        
        txtfieldMobile.delegate = self
        
        datepicker = UIDatePicker()
        datepicker?.datePickerMode = .date
        datepicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(tapGesture1)
        
          txtfieldFitness.inputView = datepicker
          txtfieldInsurance.inputView = datepicker
        
         // txtfieldExpiryDate.inputView = datepicker
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
       
            view.endEditing(true)
      
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
    
        
        txtfieldFitness.text = dateFormatter.string(from: ((datepicker?.date)!))
        txtfieldInsurance.text = dateFormatter.string(from: ((datepicker?.date)!))

      //   txtfieldExpiryDate.text = dateFormatter.string(from: ((datepicker?.date)!))
   
        
    }
    

    
    @IBAction func back_button_action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_uploadDocument_action(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let viewName:NSString = "TrucksDocumentViewController"
        let vc = storyboard.instantiateViewController(withIdentifier: viewName as String) as! TrucksDocumentViewController
        self.navigationController?.show(vc, sender: self);
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let maxLength = 10
        let currentString: NSString = txtfieldMobile.text! as! NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    func validate() -> Bool {
        
        var valid : Bool = true
        
        
        if (txtfieldMobile.text?.isEmpty)! {
            txtfieldMobile.attributedPlaceholder = NSAttributedString(string: "Please enter Mobile no.", attributes : [NSAttributedString.Key.foregroundColor : UIColor.red])
            
            valid = false
        }
        
        return valid
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
