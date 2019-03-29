//
//  VerifyNumber.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct VerifyMobile : Decodable {
    
    var mobile_no  : Int = 0
    var otp : String = ""
}

struct VerifyMobileData : Decodable {
    
    let error             : Bool
    let token             : String
    let id                : Int
    let name              : String
    let email             : String
    let email_verified_at : String
    let mobile_no         : Int
    let aadhar            : String
    let pan               : String
    let company           : String
    let gstin             : String
    let type              : Int
    let status            : String
    let otp               : String
    let otp_created_at    : String
    let is_verified       : String
    let created_at        : String
    let updated_at        : String
    let message           : String
    
}

class VerifyMobileDataFeteched : JSONDecodable {
    
    let verifyMobileData : VerifyMobileData
    
    required init(json: JSON) throws {
        
        let error              = json["error"].boolValue
        let token              = json["data"]["results"]["token"].stringValue
        let id                 = json["data"]["results"]["user"]["id"].intValue
        let name               = json["data"]["results"]["user"]["name"].stringValue
        let email              = json["data"]["results"]["user"]["email"].stringValue
        let email_verified_at  = json["data"]["results"]["user"]["email_verified_at"].stringValue
        let mobile_no          = json["data"]["results"]["user"]["mobile_no"].intValue
        let aadhar             = json["data"]["results"]["user"]["aadhar"].stringValue
        let pan                = json["data"]["results"]["user"]["pan"].stringValue
        let company            = json["data"]["results"]["user"]["company"].stringValue
        let gstin              = json["data"]["results"]["user"]["gstin"].stringValue
        let type               = json["data"]["results"]["user"]["type"].intValue
        let status             = json["data"]["results"]["user"]["status"].stringValue
        let otp                = json["data"]["results"]["user"]["otp"].stringValue
        let otp_created_at     = json["data"]["results"]["user"]["otp_created_at"].stringValue
        let is_verified        = json["data"]["results"]["user"]["is_verified"].stringValue
        let created_at         = json["data"]["results"]["user"]["created_at"].stringValue
        let updated_at         = json["data"]["results"]["user"]["updated_at"].stringValue
        let message            = json["message"].stringValue
        
        
        let verify = VerifyMobileData(error: error, token: token, id: id, name: name, email: email, email_verified_at: email_verified_at, mobile_no: mobile_no, aadhar: aadhar, pan: pan, company: company, gstin: gstin, type: type, status: status, otp: otp, otp_created_at: otp_created_at, is_verified: is_verified, created_at: created_at, updated_at: updated_at, message: message)
        
        verifyMobileData = verify
    }
    
    
}
