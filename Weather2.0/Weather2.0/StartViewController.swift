//
//  ViewController.swift
//  Weather2.0
//
//  Created by Дмитрий  Ванчугов on 30.04.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    var CurrentWeather: Int?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.networkManager(city: "Lunino")
        }
    


}

