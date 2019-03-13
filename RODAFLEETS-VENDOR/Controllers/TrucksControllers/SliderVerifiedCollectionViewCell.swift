//
//  SliderCollectionViewCell.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 20/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class SliderVerifiedCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate   {

    @IBOutlet weak var tblViewVerified: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tblViewVerified.delegate = self
        tblViewVerified.dataSource = self
        
        tblViewVerified.separatorStyle = .none
        
    }
    
    //tableviewview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblViewVerified.dequeueReusableCell(withIdentifier: "cellVerified") as! VerifiedTableViewCell
        return cell
    }
    
}


