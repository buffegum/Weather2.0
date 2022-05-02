//
//  NetworkManager.swift
//  Weather2.0
//
//  Created by Дмитрий  Ванчугов on 01.05.2022.
//

import Foundation

class NetworkManager {
    
    private init(){}
    
    static let shared = NetworkManager()
    
    func networkManager(city: String){
    //    guard let url = URL(string: "api.openweathermap.org/data/2.5/forecast?lat=53.2&lon=45&appid=\(apiKey)") else {return}
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, let str = String(data: data, encoding: .utf8) else {return}
            let weather = self.parseJSON(data: data)
            print(weather?.city.coord)
        }
        task.resume()
    }
    
    
    func parseJSON(data: Data) -> Weather?{
        let decoder = JSONDecoder()
        do{
            let weatherData = try decoder.decode(Weather.self, from: data)
            return weatherData
        }catch{
            print("woops")
        }
        return nil
    }
    
}
