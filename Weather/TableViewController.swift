//
//  TableViewController.swift
//  Weather
//
//  Created by Roshni Soni on 2/5/23.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate{
    
    let data = CityDataLoader().cityData
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    //This variable is required for search functionality
    var filteredData: [CityData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredData = data
        
    }
    
    //This method returns the total count of the data for identfying the number of rows required in tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    //This method sets teh content of each row in the tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for: indexPath)
        let state = filteredData[indexPath.row].state != "" ? (filteredData[indexPath.row].state+", "): ""
        cell.textLabel?.text = filteredData[indexPath.row].name + ", " + state + filteredData[indexPath.row].country
        return cell;
    }
    
    /*This method is called when a row is clicked, this will populate latitute, longitude, cityName of ViewController class and
    navigates to the first screen
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = filteredData[indexPath.row]
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                  
        vc.lat = city.coord.lat
        vc.lon = city.coord.lon
        vc.isNav = true
        vc.navCityName = city.name
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //This method performs search bar functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        //When searchbar is empty initially or the text is erased after typing, original list of data is displayed
        if searchText == ""{
            filteredData = data
        }
        else{
            
            for cityData in data {
                if cityData.name.lowercased().contains(searchText.lowercased()){
                    filteredData.append(cityData)
                }
            }
        }
        
        self.tableView.reloadData()
    }
}
