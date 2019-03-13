//
//  LoadDetailsViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import MarqueeLabel

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var viewFindLoads: UIView!
    @IBOutlet weak var tblviewOBJ: UITableView!
     @IBOutlet weak var lblRunningTest: MarqueeLabel!
    
    var begin : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tblviewOBJ.delegate = self
        tblviewOBJ.dataSource = self
        
        viewFindLoads.layer.borderWidth = 0.5
        viewFindLoads.layer.borderColor = UIColor.lightGray.cgColor
        viewFindLoads.layer.cornerRadius = 8.0
   
        tblviewOBJ.separatorStyle = .none
        lblRunningTest.type = .continuous
        // lblRunningTest.type = .continuousReverse
        lblRunningTest.speed = .duration(15.0)
        // lblRunningTest.lineBreakMode = .byTruncatingHead
        lblRunningTest.fadeLength = 15.0
        lblRunningTest.leadingBuffer = 40.0
        
        lblRunningTest.text  = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
        
        
        // Do any additional setup after loading the view.
    }
    
    // table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 21
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblviewOBJ.dequeueReusableCell(withIdentifier: "cellTableData", for: indexPath) as! DataTableViewCell
        return cell
    }
    
    @IBAction func btn_action(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let viewName:NSString = "FindLoadViewController"
        let vc = storyboard.instantiateViewController(withIdentifier: viewName as String) as! FindLoadViewController
        self.navigationController?.show(vc, sender: self);
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let viewName:NSString = "LoadDetailsViewController"
            let vc = storyboard.instantiateViewController(withIdentifier: viewName as String) as! LoadDetailsViewController
            self.navigationController?.show(vc, sender: self)
            
     
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

