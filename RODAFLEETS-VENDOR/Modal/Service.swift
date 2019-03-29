//
//  Service.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

class JSONZError: JSONDecodable{
    required init(json: JSON) throws {
        print("Error")
    }
}

struct Service {
    
    let tron = TRON(baseURL: API.BASE_URL)
    
    static let sharedInstance = Service()
    
    func fetchSignUp(param : NSDictionary, completion: @escaping (SignUpDataFetched) -> ()) {
        
        let request : APIRequest<SignUpDataFetched, JSONZError> = tron.swiftyJSON.request(API.API_SIGNUP)
        request.method = .post
        request.parameters  = param as! [String : Any]
        request.perform(withSuccess: { (SignUpDataFetched) in
            
            completion(SignUpDataFetched)
        }) { (JSONZError) in
            print("Json Error")
        }
    }
    
    
    func fetchLogin(param : NSDictionary, completion: @escaping (LoginDataFetched) -> ()) {
        
        let request : APIRequest<LoginDataFetched, JSONZError> = tron.swiftyJSON.request(API.API_LOGIN)
        request.method = .post
        request.parameters  = param as! [String : Any]
        request.perform(withSuccess: { (LoginDataFetched) in
            
            completion(LoginDataFetched)
        }) { (JSONZError) in
            print("Json Error")
        }
    }
    
    
    func fetchOTP(param : NSDictionary, completion: @escaping (VerifyMobileDataFeteched) -> ()) {
        
        let request : APIRequest<VerifyMobileDataFeteched, JSONZError> = tron.swiftyJSON.request(API.API_VERIFY_OTP)
        request.method = .post
        request.parameters  = param as! [String : Any]
        request.perform(withSuccess: { (VerifyMobileDataFeteched) in
            
            completion(VerifyMobileDataFeteched)
        }) { (JSONZError) in
            print("Json Error")
        }
    }
}

