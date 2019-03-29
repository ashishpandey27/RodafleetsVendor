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
        
//        viewFindLoads.layer.borderWidth = 0.5
//        viewFindLoads.layer.borderColor = UIColor.lightGray.cgColor
//        viewFindLoads.layer.cornerRadius = 8.0
   
        tblviewOBJ.separatorStyle = .none
        lblRunningTest.type = .continuous
        // lblRunningTest.type = .continuousReverse
        lblRunningTest.speed = .duration(25.0)
        // lblRunningTest.lineBreakMode = .byTruncatingHead
        lblRunningTest.fadeLength = 0.0
        lblRunningTest.leadingBuffer = 0.0
        
        lblRunningTest.text  = "Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 | Delhi-Jaipur Open-Container  ₹22,500 |"
        
        
        setUpLeftNavigationBarItem()
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
        
        MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.FindLoad)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
         MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.LoadDetails)
    }
    
 
    func setUpLeftNavigationBarItem() {
        
        let rodaButton = UIButton(type: .custom)
        rodaButton.setImage(UIImage(named: "roda"), for: .normal)
        rodaButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        rodaButton.translatesAutoresizingMaskIntoConstraints = false
        rodaButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rodaButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let barButtonRoda = UIBarButtonItem(customView: rodaButton)
        self.navigationItem.leftBarButtonItem = barButtonRoda
        
        
       
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

