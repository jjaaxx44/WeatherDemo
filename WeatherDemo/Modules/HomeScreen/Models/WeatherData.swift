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


// MARK: - WeatherError
struct WeatherError: Codable {
    let error: ErrorInfo
    enum CodingKeys: String, CodingKey {
        case error
    }
}

struct ErrorInfo: Codable {
    let code: Int
    let message: String
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
}


// MARK: - Current
struct Current: Codable {
    let condition: Condition
    let feelslikeC: Double
    let humidity: Int
    let tempC: Double
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
struct Forecastday: Identifiable, Codable {
    let id: UUID = UUID()
    let date: String
    let day: Day
    let dateEpoch: Int
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case day
        case dateEpoch = "date_epoch"
    }
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

extension WeatherData {
    static func mockData() -> WeatherData? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "mock_weather", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let weather = try JSONDecoder().decode(WeatherData.self, from: jsonData)
                return weather
            }
        } catch {
            print(error)
        }
        return nil
    }
}
