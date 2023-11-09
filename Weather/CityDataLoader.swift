//
//  CityDataLoader.swift
//  Weather
//
//  Created by Roshni Soni on 2/5/23.
//

import Foundation
import SwiftyJSON

public class CityDataLoader{
    
    @Published var cityData = [CityData]()
    
    init(){
        loadData()
        sortData()
    }
    
    //This method fetched the city data from json file, decodes it into CityData object and stores it in cityData variable
    func loadData(){
        
        if let fileLocation =  Bundle.main.url(forResource: "city.list", withExtension: "json"){
            //do catch in case of an error
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([CityData].self, from: data)
                
                self.cityData = dataFromJson     
                
            }catch{
                print(error)
            }
        }
    }
    
    //This method sorts the city data based on city name in ascending order
    func sortData(){
        self.cityData = self.cityData.sorted(by: {$0.name < $1.name})
    }
}
