//
//  SelfVerifiedCollectionViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 21/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit


class SliderSelfVerifiedCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblViewSelfVerified: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tblViewSelfVerified.delegate = self
        tblViewSelfVerified.dataSource = self
        
        tblViewSelfVerified.separatorStyle = .none
    }
    
    //tableviewview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblViewSelfVerified.dequeueReusableCell(withIdentifier: "cellSelfVerified") as! SelfVerifiedTableViewCell
        return cell
    }
    
}




