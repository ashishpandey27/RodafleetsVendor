//
//  SignUp.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct SignUp: Decodable {
    
    var name            : String = ""
    var email           : String = ""
    var mobile_no       : Int = 0
    var aadhar          : String = ""
    var pan             : String = ""
    var password        : String = ""
    var device_id       : String = ""
    var device_type     : String = ""
    var device_token    : String = ""
    var type            : Int = 0
    var company         : Int = 0
    var gstin           : Int = 0
}

struct SignUpData : Decodable {
    
    let name            : String
    let email           : String
    let mobile_no       : Int
    let aadhar          : String
    let pan             : String
    let type            : Int
    let otp             : String
    let otp_created_at  : String
    let updated_at      : String
    let created_at      : String
    let id              : Int
    let message         : String
    let error           : Bool
}

class SignUpDataFetched : JSONDecodable {
    
    let signUpData : SignUpData
    
    required init(json: JSON) throws {
        
        let error            = json["error"].boolValue
        let name             = json["data"]["results"]["name"].stringValue
        let email            = json["data"]["results"]["email"].stringValue
        let mobile_no        = json["data"]["results"]["mobile_no"].intValue
        let aadhar           = json["data"]["results"]["aadhar"].stringValue
        let pan              = json["data"]["results"]["pan"].stringValue
        let type             = json["data"]["results"]["type"].intValue
        let otp              = json["data"]["results"]["otp"].stringValue
        let otp_created_at   = json["data"]["results"]["otp"].stringValue
        let updated_at       = json["data"]["results"]["updated_at"].stringValue
        let created_at       = json["data"]["results"]["created_at"].stringValue
        let id               = json["data"]["results"]["id"].intValue
        let message          = json["message"].stringValue
        
        
        let sign = SignUpData(name: name, email: email, mobile_no: mobile_no, aadhar: aadhar, pan: pan, type: type, otp: otp, otp_created_at: otp_created_at, updated_at: updated_at, created_at: created_at, id: id, message: message, error : error)
        
        signUpData = sign
        
    }
    
    
    
}
