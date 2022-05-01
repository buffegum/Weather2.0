//
//  Constants.swift
//  Weather2.0
//
//  Created by Дмитрий  Ванчугов on 30.04.2022.
//

import Foundation

let apiKey = "e9c10226b700bf52f274cd6150b2a7a4"


func networkManager(){
//    guard let url = URL(string: "api.openweathermap.org/data/2.5/forecast?lat=53.2&lon=45&appid=\(apiKey)") else {return}
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Penza&appid=\(apiKey)") else {return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data
        else {return}
        let str = String(data: data, encoding: .utf8)
        print(str)
    }
    task.resume()
}
