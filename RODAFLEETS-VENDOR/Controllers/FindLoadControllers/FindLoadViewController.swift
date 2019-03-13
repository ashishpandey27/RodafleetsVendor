//
//  FindLoadViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class FindLoadViewController: UIViewController {
    
    @IBOutlet weak var txtfieldFROM: UITextField!
    @IBOutlet weak var txtfieldTO: UITextField!
    
    @IBOutlet weak var imageFrom: UIImageView!
    
    @IBOutlet weak var imageTo: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewMiniTruck: UIView!
    @IBOutlet weak var viewTrailer: UIView!
    @IBOutlet weak var btnFindLoads: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        imageFrom.layer.masksToBounds = false
        imageFrom.layer.cornerRadius = imageFrom.frame.height/2
        imageFrom.clipsToBounds = true
        
        imageTo.layer.masksToBounds = false
        imageTo.layer.cornerRadius = imageTo.frame.height/2
        imageTo.clipsToBounds = true
   
      
    
    }
    
    @IBAction func btn_back_action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Find_Loads_action(_ sender: Any) {
       
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


