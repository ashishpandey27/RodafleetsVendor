//
//  SettingsViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 24/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var btnLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          self.navigationController?.navigationBar.shadowImage = UIImage();

//        imageProfile.clipsToBounds = true
//        imageProfile.layer.cornerRadius = 10
       
        viewBackground.bringSubviewToFront(viewImage)
        
    }
    @IBAction func add_truck_action(_ sender: Any) {
         MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.Trucks)
    }
    
    @IBAction func add_driver_action(_ sender: Any) {
         MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.Drivers)
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
