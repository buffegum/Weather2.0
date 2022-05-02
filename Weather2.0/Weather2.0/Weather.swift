//
//  Weather.swift
//  Weather2.0
//
//  Created by Дмитрий  Ванчугов on 02.05.2022.
//

import Foundation

struct Weather: Codable {
    let city : City
    
}
struct City: Codable{
    let name : String
    let coord: Coord
}
struct Coord: Codable {
    let lat, lon: Double
}
