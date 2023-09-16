//
//  WeatherViewModel.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let service: WeatherService
    @Published var weatherData: WeatherData?
    @Published var error: NetworkError?

    var location: String {
        weatherData?.location.name ?? ""
    }

    var currentTemp: String {
        guard let temp = weatherData?.current.tempC else {
            return "-\u{2103}"
        }
        return "\(String(format: "%.1f\u{00B0}", temp))"
    }

    var feelsLikeTemp: String {
        guard let temp = weatherData?.current.feelslikeC else {
            return "-\u{2103}"
        }
        return "\(String(format: "%.1f\u{00B0}", temp))"
    }

    var currentCondition: String {
        weatherData?.current.condition.text ?? "-"
    }

    var currentConditionIcon: String? {
        weatherData?.current.condition.icon
            .replacingOccurrences(of: "//", with: "https://")
    }
    
    init(weatherData: WeatherData? = nil, service: WeatherService = WeatherService()) {
        self.weatherData = weatherData
        self.service = service
//        Task { await getWeatherData(for: "Kochi") }
    }

    @MainActor
    func getWeatherData(for location: String) async {
        self.weatherData = nil
        self.error = nil
        let result = await self.service.getForecast(searchTerm: location)
        switch(result) {
        case .success(let weatherData):
            self.weatherData = weatherData
        case .failure(let error):
            self.error = error
            print(error)
        }
    }
}
