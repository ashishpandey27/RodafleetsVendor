//
//  StateViewController.swift
//  
//
//  Created by Developer on 12/04/19.
//

import UIKit
import Alamofire
import SVProgressHUD

protocol StateListDelegate : NSObjectProtocol {
    func selectedState(statename: String, stateID : String)
    
}


class StateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableviewOBJ: UITableView!
    
    var searchActive : Bool = false
    var selectedState : String = ""
    
    var delegate : StateListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewOBJ.delegate = self
        tableviewOBJ.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
        
        searchBar.placeholder = "Select states"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paramState()
    }
    
    
    // search bar delegate methods
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        paramState()
    }
    
    // tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CONSTANTVARIABLES.stateName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewOBJ.dequeueReusableCell(withIdentifier: "cellState", for: indexPath) as! StateTableViewCell
        
        cell.lblState.text = CONSTANTVARIABLES.stateName[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedState = CONSTANTVARIABLES.stateName[indexPath.row]
        CONSTANTVARIABLES.selectedState = selectedState
        
        var state_id_index = CONSTANTVARIABLES.state_id[indexPath.row]
        CONSTANTVARIABLES.state_id_index = state_id_index
        print(CONSTANTVARIABLES.state_id_index)
        
        delegate?.selectedState(statename: selectedState, stateID : CONSTANTVARIABLES.state_id_index)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func paramState() {
        
        let dict = NSMutableDictionary()
        dict.setValue(searchBar.text, forKey: "title")
        
        print(searchBar.text!)
        callStateListAPI(parameters: dict)
    }
    
    func callStateListAPI(parameters: NSDictionary) {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_STATE_LIST)
        let headers = ["Authorization" : "Bearer "+CONSTANTVARIABLES.token+"",
                       "Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: headers ).responseJSON {  (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                SVProgressHUD.show()
                if response.result.value != nil {
                    SVProgressHUD.dismiss()
                    let json = response.result.value as! NSDictionary
                    print(json)
                    let err = json.value(forKey: "error") as! Bool
                    if err == false {
                        
                        let data = json.value(forKey: "data") as! NSDictionary
                        let results = data.value(forKey: "results") as! NSArray
                        
                        let name  = results.value(forKey: "name")  as! NSArray
                        CONSTANTVARIABLES.stateName = name as! [String]
                        print(CONSTANTVARIABLES.stateName)
                        
                        let state_id = results.value(forKey: "state_id") as! NSArray
                        CONSTANTVARIABLES.state_id = state_id as! [String]
                        print(CONSTANTVARIABLES.state_id)
                        
                        self.tableviewOBJ.reloadData()
                    }
                }
                
            case .failure(_):
                MyUtility.showAlert("Error", "Something went wrong", controller: self)
                
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

