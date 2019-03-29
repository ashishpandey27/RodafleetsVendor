//
//  MainViewController.swift
//  RODAFLEETS-VENDOR
//
//  Created by Developer on 29/03/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, GetDataBack {
    
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var viewLayout: UIView!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    var pageViewController: UIPageViewController!
    var loginController: LoginViewController!
    var signUPController: SignUPViewController!
    var controllers = [UIViewController]()
    
    
    var lastPage = 0
    var currentPage: Int = 0 {
        didSet {
            if currentPage > lastPage {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
            }
            else {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .reverse, animated: true, completion: nil)
            }
            
            lastPage = currentPage
        }
    }
    
    func sendDataBackToPreviousController(textData: String) {
        lblType.text = textData
    }
    
    func getBackTag(index: Int) {
        CONSTANTVARIABLES.type = index
        print(CONSTANTVARIABLES.type)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewLayout.layer.cornerRadius = viewLayout.frame.height / 2
        btnLogin.layer.cornerRadius = btnLogin.frame.height / 2
        btnSignUp.layer.cornerRadius = btnSignUp.frame.height / 2
        btnLogin.isSelected = true
        btnChange.isHidden = true
        lblType.isHidden = true
        
        
        pageViewController = self.children.first as! UIPageViewController
        loginController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        signUPController = storyboard?.instantiateViewController(withIdentifier: "SignUPViewController") as! SignUPViewController
        
        // pageViewController.dataSource = self
        
        pageViewController.setViewControllers([loginController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        
        controllers.append(loginController)
        controllers.append(signUPController)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func pageChangeAction(_ sender: UIButton) {
        
        currentPage = sender.tag - 100
        btnLogin.isSelected = !btnLogin.isSelected
        btnSignUp.isSelected = !btnSignUp.isSelected
        
        if (btnLogin.isSelected)
        {
            btnLogin.backgroundColor = UIColor(red: 252/255, green: 154/255, blue: 0/255, alpha: 1.0)
            btnSignUp.backgroundColor = UIColor.white
            btnLogin.isSelected = true
            btnSignUp.isSelected = false
            btnChange.isHidden = true
            lblType.isHidden = true
        }
        if (btnSignUp.isSelected) {
            btnSignUp.backgroundColor = UIColor(red: 252/255, green: 154/255, blue: 0/255, alpha: 1.0)
            btnLogin.backgroundColor = UIColor.white
            btnLogin.isSelected = false
            btnSignUp.isSelected = true
            btnChange.isHidden = false
            lblType.isHidden = false
            showPopOver()
            
        }
    }
    
    func showPopOver() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        popOverVC.delegate = self
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
    }
    
    
    @IBAction func btn_change_action(_ sender: Any) {
        showPopOver()
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


