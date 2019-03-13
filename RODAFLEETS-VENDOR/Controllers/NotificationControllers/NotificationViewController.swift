//
//  NotificationViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 06/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    @IBOutlet weak var tblviewObj: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblviewObj.dataSource = self
        tblviewObj.delegate = self

        tblviewObj.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 252/255, green: 154/255, blue: 2/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
         navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblviewObj.dequeueReusableCell(withIdentifier: "cellNotification", for: indexPath) as! NotificationTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
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
