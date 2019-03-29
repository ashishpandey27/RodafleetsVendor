//
//  MyUtility.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class MyUtility : NSObject {
    
    class func showController(selfController : UIViewController , storyboard : String, identifier : String) {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewName : NSString = identifier as NSString
        let newContoller = storyboard.instantiateViewController(withIdentifier: viewName as String )
        selfController.navigationController?.show(newContoller, sender: self)
        
    }
    
    class  func showAlert(_ title:NSString,_ msg:NSString, controller: UIViewController) {
        let actionSheetController: UIAlertController = UIAlertController(title: title as String, message: msg as String, preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        controller.present(actionSheetController, animated: true, completion: nil)
    }
}
