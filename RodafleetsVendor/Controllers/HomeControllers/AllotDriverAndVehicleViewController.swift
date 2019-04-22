//
//  AllotDriverAndVehicleViewController.swift
//  RodafleetsVendor
//
//  Created by Developer on 16/04/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import Alamofire
import DLRadioButton
import SVProgressHUD
import DropDown

class AllotDriverAndVehicleViewController: UIViewController {

    @IBOutlet weak var txtfieldVehicle: UITextField!
    @IBOutlet weak var txtfieldDriver: UITextField!
    @IBOutlet weak var lblBookingID: UILabel!
    @IBOutlet weak var btnSubmit: CustomButton!
    @IBOutlet weak var btnDriver: UIButton!
    @IBOutlet weak var btnVehicle: UIButton!
    
     var arrDataVehicle = NSMutableArray()
     var arrDataDriver = NSMutableArray()
     let dropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
      lblBookingID.text = CONSTANTVARIABLES.bookingID
        
        callDriverListAPI()
        callVehicleListAPI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_choose(_ sender: DLRadioButton) {
        print(sender.tag)
        if sender.tag == 1 {
            txtfieldDriver.isUserInteractionEnabled = false
        }
    }
   
    
    @IBAction func btn_select_driver(_ sender: Any) {
        
        dropDown.anchorView = btnDriver
        dropDown.dataSource = CONSTANTVARIABLES.drivers
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.txtfieldDriver.text = item
            var drivers_index = CONSTANTVARIABLES.drivers_id[index]
            print(drivers_index)
            CONSTANTVARIABLES.driver_index = drivers_index
        }
            
    }
        
    @IBAction func btn_select_vehicle(_ sender: Any) {
        
        dropDown.anchorView = btnVehicle
        dropDown.dataSource = CONSTANTVARIABLES.vehicles
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.txtfieldVehicle.text = item
            var vehicle_index = CONSTANTVARIABLES.vehicles_id[index]
            print(vehicle_index)
            CONSTANTVARIABLES.vehicle_index = vehicle_index
        }
          
    }
    
    @IBAction func btnSubmit_action(_ sender: Any) {
        param()
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
    func param() {
        
        let dict = NSMutableDictionary()
         dict.setValue( "\(CONSTANTVARIABLES.bookingID)", forKey: "booking_id")
         dict.setValue("\(CONSTANTVARIABLES.driver_index)", forKey: "drivers")
         dict.setValue("\(CONSTANTVARIABLES.vehicle_index)", forKey: "vehicles")
        
        callAssignVehicleAndDriverAPI(parameters: dict)
    }
    
    
    
    func callAssignVehicleAndDriverAPI(parameters : NSDictionary) {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_ASSIGN_VEHICLE_DRIVER)
        let headers = ["Authorization" : "Bearer "+CONSTANTVARIABLES.token+"",
                       "Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: parameters as! Parameters, encoding: JSONEncoding.default, headers: headers ).responseJSON {  (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                SVProgressHUD.show()
                if response.result.value != nil {
                    SVProgressHUD.dismiss()
                    let json = response.result.value as! NSDictionary
                    print(json)
                    let err = json.value(forKey: "error") as! Bool
                   
                }
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
            }
            
        }
    }

    func callDriverListAPI() {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_DRIVER_LIST)
        let headers = ["Authorization" : "Bearer "+CONSTANTVARIABLES.token+"",
                       "Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers ).responseJSON {  (response:DataResponse<Any>) in
            
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
                        let results = data.value(forKey: "results") as! NSArray
                        self.arrDataDriver = results.mutableCopy() as! NSMutableArray
                        
                        let name = results.value(forKey: "name") as! NSArray
                        print(name)
                        CONSTANTVARIABLES.drivers = name as! [String]
                        let driver_type_id = results.value(forKey: "driver_id") as! NSArray
                        CONSTANTVARIABLES.drivers_id = driver_type_id as! [String]
                        
                    }
                }
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
            }
            
        }
    }
    
    
    func callVehicleListAPI() {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_VEHICLE_LIST)
        let headers = ["Authorization" : "Bearer "+CONSTANTVARIABLES.token+"",
                       "Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers ).responseJSON {  (response:DataResponse<Any>) in
            
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
                        let results = data.value(forKey: "results") as! NSArray
                        self.arrDataVehicle = results.mutableCopy() as! NSMutableArray
                        
                        let name = results.value(forKey: "vehicle_name") as! NSArray
                        CONSTANTVARIABLES.vehicles = name as! [String]
                        
                        let vehicle_type_id = results.value(forKey: "vehicle_type_id") as! NSArray
                        CONSTANTVARIABLES.vehicles_id = vehicle_type_id as! [String]
                        
                    }
                }
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
            }
            
        }
    }
}
