//
//  WeatherData.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let current: Current
    let forecast: Forecast
    let location: Location
}

// MARK: - Current
struct Current: Codable {
    let condition: Condition
    let feelslikeC: Double
    let humidity: Int
    let tempC: Int
    let windKph: Double
    
    enum CodingKeys: String, CodingKey {
        case condition
        case feelslikeC = "feelslike_c"
        case humidity
        case tempC = "temp_c"
        case windKph = "wind_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let code: Int
    let icon: String
    let text: String
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let day: Day
}

// MARK: - Day
struct Day: Codable {
    let avghumidity: Int
    let avgtempC: Double
    let condition: Condition
    let maxtempC, mintempC: Double
    
    enum CodingKeys: String, CodingKey {
        case avghumidity
        case avgtempC = "avgtemp_c"
        case condition
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
}
