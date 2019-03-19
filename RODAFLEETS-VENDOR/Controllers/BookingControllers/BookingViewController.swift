//
//  BookingViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 13/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblviewOBJ: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblviewOBJ.delegate = self
        tblviewOBJ.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_btn_action(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 252/255, green: 154/255, blue: 2/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblviewOBJ.dequeueReusableCell(withIdentifier: "cellBooking", for: indexPath) as! BookingTableViewCell
        return cell
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



