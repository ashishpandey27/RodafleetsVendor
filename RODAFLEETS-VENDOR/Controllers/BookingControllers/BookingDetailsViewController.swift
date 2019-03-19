//
//  BookingDetailsViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tbleviewOBJ: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbleviewOBJ.dataSource = self
        tbleviewOBJ.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btn_back_action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return UITableView.automaticDimension
        }
            
        else {
            return 244
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tbleviewOBJ.dequeueReusableCell(withIdentifier: "cellDistance", for: indexPath) as! DistanceTableViewCell
            
            return cell
        }
            
        else{
            let cell1 = tbleviewOBJ.dequeueReusableCell(withIdentifier: "cellShipment", for: indexPath) as! ShipmentTableViewCell
            
            
            return cell1
        }
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



