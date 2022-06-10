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
        
       guard let url = URL(string:"https://api.weather.yandex.ru/v2/forecast?lat=55§.2007&lon=46.0046&extra=true") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "X-Yandex-API-Key")
            
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {return}
            let inf = String(data: data, encoding: .utf8)
            guard let json = self.parseJSON(data: data) else {return}
            let a = json.geoObject?.locality?.name
            print(a)
            //print(inf)
        }
        task.resume()
    }
    
    
    func parseJSON(data: Data) -> JSON?{
        let decoder = JSONDecoder()
        do{
            let json = try decoder.decode(JSON.self, from: data)
            return json
        }catch{
            print("Decode error")
        }
        return nil
    }
    
}
