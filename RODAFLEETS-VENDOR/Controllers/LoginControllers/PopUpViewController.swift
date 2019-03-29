//
//  PopUpViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import DLRadioButton
protocol GetDataBack {
    func sendDataBackToPreviousController(textData : String)
    func getBackTag(index:Int)
}


class PopUpViewController: UIViewController {
    
    @IBOutlet weak var btnIndividual: DLRadioButton!
    @IBOutlet weak var btnCommercial: DLRadioButton!
    @IBOutlet weak var viewPop: UIView!
    
    var delegate : GetDataBack? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewPop.layer.cornerRadius = 8.0
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        showAnimate()
    }
    
    @IBAction func btn_done_action(_ sender: UIButton) {
        removeAnimate()
        print(sender.tag)
        
        switch sender.tag {
        case 3:
            print("Joining as a Commercial")
            CONSTANTVARIABLES.text = "Joining as a Commercial"
            print(CONSTANTVARIABLES.text)
            print(CONSTANTVARIABLES.tag)
            delegate?.sendDataBackToPreviousController(textData: CONSTANTVARIABLES.text)
            delegate?.getBackTag(index: sender.tag)
            
        case 2:
            print("Joining as an Individual")
            CONSTANTVARIABLES.text = "Joining as an Individual"
            print(CONSTANTVARIABLES.tag)
            delegate?.sendDataBackToPreviousController(textData: CONSTANTVARIABLES.text)
            delegate?.getBackTag(index: sender.tag)
        default:
            break
        }
    }
    
    func showAnimate() {
        
        self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
            
        }) { (finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        }
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
