//
//  TrucksViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 24/01/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class TrucksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionviewSliderOBJ: UICollectionView!
    @IBOutlet weak var horizontalInvisibleBar: UIView!
    @IBOutlet weak var collectionViewOBJ: UICollectionView!
   
    
    let content = ["VERIFIED", "UN-VERIFIED", "SELF-VERIFIED"]
    
    var isSelected: Bool = false
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  navigationController?.navigationBar.barTintColor = UIColor.white

        collectionViewOBJ.dataSource = self
        collectionViewOBJ.delegate = self

        collectionviewSliderOBJ.dataSource = self
        collectionviewSliderOBJ.delegate = self
        collectionviewSliderOBJ.isPagingEnabled = true
        collectionviewSliderOBJ.reloadData()
      
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionViewOBJ.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .right)
     
        setUpHorizontalBar()
        
        
      
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 252/255, green: 154/255, blue: 2/255, alpha: 1.0)
    }
    
    @IBAction func btn_back_action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //collectionview methods
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == collectionViewOBJ {
        return content.count
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == collectionViewOBJ {
       
            let padding: CGFloat =  25
            let collectionViewSize = self.view.frame.size.width / 3 - padding
        
                 return CGSize(width: collectionViewSize , height: 30)
        } else {
            
                 return CGSize(width:self.view.frame.size.width, height: self.view.frame.size.height - 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView == collectionViewOBJ {
             return UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
        } else {
             return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionviewSliderOBJ {
            
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSliderVerified", for: indexPath) as! SliderVerifiedCollectionViewCell
            
            let cell12 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSliderUnverified", for: indexPath) as! SliderUnverifiedCollectionViewCell
            
            let cell13 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSliderSelfVerified", for: indexPath) as! SliderSelfVerifiedCollectionViewCell
            
            
            if indexPath.item == 0 {
                return cell1
            } else if indexPath.item == 1 {
                return cell12
            } else {
                return cell13
            }
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTrucks", for: indexPath) as! DataArrayCollectionViewCell
            
            cell.lblData.text = content[indexPath.item]
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)

       scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    
    
    // scrollview method
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
    }
    
    
    func scrollToMenuIndex(menuIndex :Int) {
        
         let indexPath = NSIndexPath(item: menuIndex, section: 0)
        print(indexPath)
        collectionviewSliderOBJ.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .right)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / collectionviewSliderOBJ.frame.width

        let indexPath = NSIndexPath(item: Int(index), section: 0)

        collectionViewOBJ.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .right)
    }
    
    
    func setUpHorizontalBar() {
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        horizontalInvisibleBar.addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.horizontalInvisibleBar.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.horizontalInvisibleBar.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.horizontalInvisibleBar.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4
            ).isActive = true
       
    }
   
   
    
    @IBAction func btn_add_action(_ sender: Any) {
        
         MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.AddTruck)
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









//        let x = CGFloat(indexPath.item) * collectionViewOBJ.frame.width/3
//        horizontalBarLeftAnchorConstraint?.constant = x
//
//
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)



