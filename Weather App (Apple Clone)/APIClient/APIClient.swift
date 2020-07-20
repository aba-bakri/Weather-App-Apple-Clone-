//
//  APIClient.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation
import Alamofire
import INTULocationManager

enum APIError: Error {
    case unkownError
    case unableToLocateUser
}

class APIClient {
    
    static let shared: APIClient = APIClient()
    
    private var serverUrl: String = "https://api.darksky.net/forecast"
    private var apiKey: String = "2fddd4a62f33b40d48557b05c6a88adf"
    
    func retrieveForecast(with location: CLLocation, completionHandler: @escaping (_ success: Bool, _ forecast: WeatherResponse?, _ error: Error?) -> Void) {
        AF.request("\(serverUrl)/\(apiKey)/\(location.coordinate.latitude),\(location.coordinate.longitude)").responseDecodable { (response: DataResponse<WeatherResponse, AFError>) in
//            if let error = response.error {
//                completionHandler(false, nil, error)
//            } else if let forecast = response.result.value {
//               completionHandler(true, forecast, nil)
//            } else {
//                completionHandler(false, nil, APIError.unkownError)
//            }
            
            switch response.result {
            case .success(_):
                let data = response.value
                completionHandler(true, data, nil)
            case .failure(_):
                completionHandler(false, nil, APIError.unkownError)
            }
        }
    }
    
    func retrieveForecastForCurrentLocation(completionHandler: @escaping (_ success: Bool, _ forecast: WeatherResponse?, _ error: Error?) -> Void) {
        let locationManager: INTULocationManager = INTULocationManager.sharedInstance()
        locationManager.requestLocation(withDesiredAccuracy: .city, timeout: 10.0, delayUntilAuthorized: true) { (currentLocation, achievedAccuracy, status) in
            guard let currentLocation = currentLocation else {
                completionHandler(false, nil, APIError.unableToLocateUser)
                return
            }
            self.retrieveForecast(with: currentLocation, completionHandler: completionHandler)
        }
    }
    
    
}
