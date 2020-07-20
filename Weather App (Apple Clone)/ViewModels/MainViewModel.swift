//
//  MainViewModel.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/20/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

class MainViewModel {
    
    var weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var cityText: String {
        guard let city = weather.timezone else {
            return ""
        }
        return city
    }
}
