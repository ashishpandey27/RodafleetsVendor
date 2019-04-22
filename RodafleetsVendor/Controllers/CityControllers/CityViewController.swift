//
//  CityViewController.swift
//  RodafleetsVendor
//
//  Created by Developer on 12/04/19.
//  Copyright © 2019 Neuweg Technologies. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

protocol CityListDelegate : NSObjectProtocol {
    func selectedCity(cityname: String,tag : Int, cityID : String)
    
}

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableviewOBJ: UITableView!
    var searchActive : Bool = false
    var selectedCity : String = ""
    
      var delegate : CityListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableviewOBJ.delegate = self
        tableviewOBJ.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
        
        searchBar.placeholder = "Select cities"
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paramCity()
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
        
        paramCity()
    }
    
    // tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CONSTANTVARIABLES.cityName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewOBJ.dequeueReusableCell(withIdentifier: "cellCity", for: indexPath) as! CityTableViewCell
        
        cell.lblCIty.text! = CONSTANTVARIABLES.cityName[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCity = CONSTANTVARIABLES.cityName[indexPath.row]
        CONSTANTVARIABLES.selectedCity = selectedCity
        print(selectedCity)
        
        var city_id_index = CONSTANTVARIABLES.city_id[indexPath.row]
        CONSTANTVARIABLES.city_id_index = city_id_index
        print(CONSTANTVARIABLES.city_id_index)
        
        delegate?.selectedCity(cityname: selectedCity,tag : CONSTANTVARIABLES.city_tag,  cityID : CONSTANTVARIABLES.city_id_index)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func paramCity() {
        
        let dict = NSMutableDictionary()
        dict.setValue(searchBar.text, forKey: "title")
        
        print(searchBar.text!)
        callCityListAPI(parameters: dict)
    }
    
    func callCityListAPI(parameters: NSDictionary) {
        
        let url = String(format: "%@%@",API.BASE_URL,API.API_CITY_LIST)
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
                        CONSTANTVARIABLES.cityName = name as! [String]
                        print(CONSTANTVARIABLES.cityName)
                        
                        let city_id = results.value(forKey: "city_id") as! NSArray
                        CONSTANTVARIABLES.city_id = city_id as! [String]
                        print(CONSTANTVARIABLES.city_id)
                        
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
