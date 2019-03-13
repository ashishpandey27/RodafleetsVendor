//
//  qddCollectionViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class DriverUnverifiedCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblViewUnverified: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tblViewUnverified.delegate = self
        tblViewUnverified.dataSource = self
        
         tblViewUnverified.separatorStyle = .none
    }
    
    //tableviewview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblViewUnverified.dequeueReusableCell(withIdentifier: "cellUnverified") as! DriverUnVerifiedTableViewCell
        return cell
    }
    
}


