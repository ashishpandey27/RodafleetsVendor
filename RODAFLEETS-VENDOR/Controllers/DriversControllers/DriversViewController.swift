//
//  DriversViewController.swift
//  Rodafleets - Vendor
//
//  Created by Developer on 01/02/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class DriversViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionViewOBJ: UICollectionView!
    @IBOutlet weak var collectionviewSliderOBJ: UICollectionView!
    @IBOutlet weak var horizontalInvisibleBar: UIView!
    
    let content = ["VERIFIED", "UN-VERIFIED"]
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    // collectionView methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewOBJ {
            return content.count
        } else {
            return 2
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
         if collectionView == collectionViewOBJ {
        
              let padding: CGFloat =  25
              let collectionViewSize = self.view.frame.size.width / 2 - padding
        
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
        
                let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSliderVerified", for: indexPath) as! DriverVerifiedCollectionViewCell
            
                let cell12 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSliderUnverified", for: indexPath) as! DriverUnverifiedCollectionViewCell
            
                if indexPath.item == 0 {
                          return cell1
                    } else {
                          return cell12
                    }
    
           } else {
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDriver", for: indexPath) as! DataArrayCollectionViewCell
        
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
        
                horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
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
              horizontalBarView.widthAnchor.constraint(equalTo: self.horizontalInvisibleBar.widthAnchor, multiplier: 1/2).isActive = true
              horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
       }
    
    
    
    
    @IBAction func btn_add_action(_ sender: Any) {
        MyUtility.showController(selfController: self, storyboard: StoryboardName.Dashboard, identifier: ViewIdentifiers.AddDriver)
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

