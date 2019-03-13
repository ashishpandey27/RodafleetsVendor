//
//  LoadDetailsViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 23/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class LoadDetailsViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
   
    var timr=Timer()
    var w:CGFloat=0.0
    

    @IBOutlet weak var viewFindLoads: UIView!
    @IBOutlet weak var collectionViewOBJ: UICollectionView!
    @IBOutlet weak var tblviewOBJ: UITableView!
    
    var begin : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOBJ.dataSource = self
        collectionViewOBJ.delegate = self
        
        tblviewOBJ.delegate = self
        tblviewOBJ.dataSource = self
        
        viewFindLoads.layer.borderWidth = 0.5
        viewFindLoads.layer.borderColor = UIColor.lightGray.cgColor
        viewFindLoads.layer.cornerRadius = 8.0
   
        tblviewOBJ.separatorStyle = .none
       
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        configAutoscrollTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        deconfigAutoscrollTimer()
    }
    
    func configAutoscrollTimer()
    {
        
        timr=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(autoScrollView), userInfo: nil, repeats: true)
    }
    func deconfigAutoscrollTimer()
    {
        timr.invalidate()
        
    }
    func onTimer()
    {
        autoScrollView()
    }
    
    @objc func autoScrollView()
    {
        
        let initailPoint = CGPoint(x: w,y :0)
        
        if __CGPointEqualToPoint(initailPoint, initailPoint)
        {
            if w<collectionViewOBJ.contentSize.width
            {
                w += 0.5
            }
            else
            {
                w = -self.view.frame.size.width
            }
            
            let offsetPoint = CGPoint(x: w,y :0)
            
            collectionViewOBJ.contentOffset=offsetPoint
            
        }
        else
        {
            w=collectionViewOBJ.contentOffset.x
        }
    }
   
    
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
            if let coll  = self.collectionViewOBJ {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < 5 - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: 0)
                    
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
            }
        }
    }
    
    
    func performTaskInBackground(task:@escaping () throws -> ()) {
        DispatchQueue.global(qos: .background).async {
            do {
                try self.configAutoscrollTimer()
            } catch let error as NSError {
                print("error in background thread:\(error.localizedDescription)")
            }
        }
    }

    
    // collection view methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionViewOBJ.dequeueReusableCell(withReuseIdentifier: "cellCollectionData", for: indexPath) as! DataCollectionViewCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
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
    
 
 
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

