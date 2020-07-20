//
//  ViewController.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/17/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var retrievedForecast: WeatherResponse? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CurrentlyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentlyTableViewCell")
        tableView.register(UINib(nibName: "HourlyTableViewCell", bundle: nil), forCellReuseIdentifier: "HourlyTableViewCell")
        tableView.register(UINib(nibName: "DailyTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyTableViewCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        
        retrieveWeatherData()
    }
    
    
    func retrieveWeatherData() {
        APIClient.shared.retrieveForecastForCurrentLocation { (_, forecast, error) in
            if let error = error {
                print("[API Error]", error.localizedDescription)
            } else if let forecast = forecast {
                self.retrievedForecast = forecast
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return retrievedForecast == nil ? 0 : 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return retrievedForecast?.daily?.data?.count ?? 0
        case 3:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1:
            return 92
        case 2:
            return 52
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentlyTableViewCell") as! CurrentlyTableViewCell
            if let currently = retrievedForecast?.currently {
                cell.currentlyViewModel = CurrentlyViewModel(currently: currently)
            }
            cell.cityLabel.text = retrievedForecast?.timezone
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTableViewCell") as! HourlyTableViewCell
            if let hourly = retrievedForecast?.hourly {
                cell.hourlyViewModel = HourlyViewModel(hourly: hourly)
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell") as! DailyTableViewCell
            if let dailyDatum = retrievedForecast?.daily?.data?[indexPath.row] {
                cell.dailyDatumViewModel = DailyDatumViewModel(dailyDatum: dailyDatum)
            }
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

