//
//  HourlyViewModel.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/19/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

class HourlyViewModel {
    
    var hourly: Hourly
    
    init(hourly: Hourly) {
        self.hourly = hourly
    }
    
    var hourlyDataArray: [Currently] {
        guard let hourlyDataArray = hourly.data else {
            return []
        }
        var filteredHourlyDataArray: [Currently] = []
        
        for currently in hourlyDataArray {
            filteredHourlyDataArray.append(currently)
            
            if (filteredHourlyDataArray.count > 23) {
                break
            }
        }
        return filteredHourlyDataArray
    }
    
}
