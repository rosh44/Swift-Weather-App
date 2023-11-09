//
//  CityData.swift
//  Weather
//
//  Created by Roshni Soni on 2/5/23.
//
// This file represents the struct for the cities data fetched from json file 
//

import Foundation

struct CityData: Codable {
    
    var id: Int
    var name: String
    var state: String
    var country: String
    var coord: CityCoord
}

struct CityCoord: Codable{
    var lat: Double
    var lon: Double
}
