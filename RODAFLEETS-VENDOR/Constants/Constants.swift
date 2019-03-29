//
//  Constants.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit


struct API {
    
    static var BASE_URL              : String  =  "http://13.234.146.109/api/"
    
    static var API_SIGNUP            : String  =   "users/register"
    static var API_LOGIN             : String  =   "users/login"
    static var API_VERIFY_OTP        : String  =   "users/verifyOtp"
    //constants
    
    static var EMAIL                 :    String  =   "email"
    static var PASSWORD              :    String  =   "password"
    static var DEVICE_ID             :    String  =   "device_id"
    static var DEVICE_TOKEN          :    String  =   "device_token"
    static var DEVICE_TYPE           :    String  =   "device_type"
    static var TOKEN                 :    String  =    "token"
    
}


struct ViewIdentifiers {
    
    static var Home                  :     String = "HomeViewController"
    static var Drivers               :     String = "DriversViewController"
    static var AddDriver             :     String = "AddDriverViewController"
    static var DriverDocuments       :     String = "DriverDocumentsViewController"
    static var Trucks                :     String = "TrucksViewController"
    static var AddTruck              :     String = "AddTruckViewController"
    static var TrucksDocuments       :     String = "TrucksDocumentsViewController"
    static var LoadDetails           :     String = "LoadDetailsViewController"
    static var FindLoad              :     String = "FindLoadViewController"
    static var Notification          :     String = "NotificationViewController"
    static var Settings              :     String = "SettingsViewController"
    static var VerifyMobile          :     String = "VerifyOTPViewController"
    static var PopOver               :     String = "PopUpViewController"
}

struct StoryboardName {
    static var Main                : String = "Main"
    static var Dashboard           : String = "Dashboard"
}

struct CONSTANTVARIABLES {
    
    static var pickupAddress : String = ""
    static var dropAddress   : String = ""
    static var mobile        : Int    = 0
    static var tag           : Int    = 0
    static var text          : String = ""
    static var type          : Int = 0
    static var otpCode       : String = ""
    static var name          : String = ""
    static var deviceToken   : String = ""
}
