//
//  WeatherModel.swift
//  Weather App (Apple Clone)
//
//  Created by Aba-Bakri on 7/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let currently: Currently?
    let minutely: Minutely?
    let hourly: Hourly?
    let daily: Daily?
    let flags: Flags?
    let offset: Int?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case timezone = "timezone"
        case currently = "currently"
        case minutely = "minutely"
        case hourly = "hourly"
        case daily = "daily"
        case flags = "flags"
        case offset = "offset"
    }
}

struct Currently: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let nearestStormDistance: Int?
    let nearestStormBearing: Int?
    let precipIntensity: Double?
    let precipProbability: Double?
    let temperature: Double?
    let apparentTemperature: Double?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let visibility: Double?
    let ozone: Double?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case summary = "summary"
        case icon = "icon"
        case nearestStormDistance = "nearestStormDistance"
        case nearestStormBearing = "nearestStormBearing"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
        case temperature = "temperature"
        case apparentTemperature = "apparentTemperature"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windGust = "windGust"
        case windBearing = "windBearing"
        case cloudCover = "cloudCover"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case ozone = "ozone"
    }
}

struct Daily: Codable {
    let summary: String?
    let icon: String?
    let data: [DailyDatum]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct DailyDatum: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let sunriseTime: Int?
    let sunsetTime: Int?
    let moonPhase: Double?
    let precipIntensity: Double?
    let precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let precipType: String?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windGustTime: Int?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let uvIndexTime: Int?
    let visibility: Double?
    let ozone: Double?
    let temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case summary = "summary"
        case icon = "icon"
        case sunriseTime = "sunriseTime"
        case sunsetTime = "sunsetTime"
        case moonPhase = "moonPhase"
        case precipIntensity = "precipIntensity"
        case precipIntensityMax = "precipIntensityMax"
        case precipIntensityMaxTime = "precipIntensityMaxTime"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case temperatureHigh = "temperatureHigh"
        case temperatureHighTime = "temperatureHighTime"
        case temperatureLow = "temperatureLow"
        case temperatureLowTime = "temperatureLowTime"
        case apparentTemperatureHigh = "apparentTemperatureHigh"
        case apparentTemperatureHighTime = "apparentTemperatureHighTime"
        case apparentTemperatureLow = "apparentTemperatureLow"
        case apparentTemperatureLowTime = "apparentTemperatureLowTime"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windGust = "windGust"
        case windGustTime = "windGustTime"
        case windBearing = "windBearing"
        case cloudCover = "cloudCover"
        case uvIndex = "uvIndex"
        case uvIndexTime = "uvIndexTime"
        case visibility = "visibility"
        case ozone = "ozone"
        case temperatureMin = "temperatureMin"
        case temperatureMinTime = "temperatureMinTime"
        case temperatureMax = "temperatureMax"
        case temperatureMaxTime = "temperatureMaxTime"
        case apparentTemperatureMin = "apparentTemperatureMin"
        case apparentTemperatureMinTime = "apparentTemperatureMinTime"
        case apparentTemperatureMax = "apparentTemperatureMax"
        case apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
    }
}

struct Flags: Codable {
    let sources: [String]?
    let units: String?
    
    enum CodingKeys: String, CodingKey {
        case sources = "sources"
        case units = "units"
    }
}

struct Hourly: Codable {
    let summary: String?
    let icon: String?
    let data: [Currently]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct Minutely: Codable {
    let summary: String?
    let icon: String?
    let data: [MinutelyDatum]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct MinutelyDatum: Codable {
    let time: Int?
    let precipIntensity: Int?
    let precipProbability: Int?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
    }
}
