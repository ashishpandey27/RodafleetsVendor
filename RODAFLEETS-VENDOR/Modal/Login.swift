//
//  Login.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Login: Decodable {
    
    var email           : String = ""
    var mobile_no       : Int = 0
    var password        : String = ""
    var device_id       : String = ""
    var device_type     : String = ""
    var device_token    : String = ""
    var type            : Int = 0
}

struct LoginData : Decodable {
    
    let error           : Bool
    let token           : String
    let name            : String
    let email           : String
    let mobile_no       : Int
    let is_verified     : Int
    let created_at      : String
    let message         : String
    
}

class LoginDataFetched : JSONDecodable {
    
    let loginData : LoginData
    
    required init(json: JSON) throws {
        
        let error            = json["error"].boolValue
        let token            = json["data"]["results"]["token"].stringValue
        let name             = json["data"]["results"]["user"]["name"].stringValue
        let email            = json["data"]["results"]["user"]["email"].stringValue
        let mobile_no        = json["data"]["results"]["user"]["mobile_no"].intValue
        let is_verified      = json["data"]["results"]["user"]["is_verified"].intValue
        let created_at       = json["data"]["results"]["user"]["created_at"].stringValue
        let message          = json["message"].stringValue
        
        let lgn = LoginData(error: error, token: token, name: name, email: email, mobile_no: mobile_no, is_verified: is_verified, created_at: created_at, message: message)
        
        loginData = lgn
        
    }
    
    
    
}
