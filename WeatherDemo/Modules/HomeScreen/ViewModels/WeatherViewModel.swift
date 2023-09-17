//
//  WeatherViewModel.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let service: WeatherServiceProtocol
    @Published var weatherData: WeatherData?
    @Published var error: NetworkError?

    var location: String {
        weatherData?.location.name ?? ""
    }

    var currentTemp: String {
        guard let temp = weatherData?.current.tempC else {
            return "-\u{00B0}"
        }
        return "\(String(format: "%.1f\u{00B0}", temp))"
    }

    var feelsLikeTemp: String {
        guard let temp = weatherData?.current.feelslikeC else {
            return "-\u{00B0}"
        }
        return "\(String(format: "%.1f\u{00B0}", temp))"
    }

    var humidity: String {
        "\(String(format: "%d%%", weatherData?.current.humidity ?? 0))"
    }

    var wind: String {
        "\(String(format: "%.1f kph", weatherData?.current.windKph ?? 0))"
    }

    var currentCondition: String {
        weatherData?.current.condition.text ?? "-"
    }

    var currentConditionIcon: String? {
        weatherData?.current.condition.icon
            .replacingOccurrences(of: "//", with: "https://")
    }

    var forecast: [Forecastday] {
        weatherData?.forecast.forecastday ?? []
    }

    init(weatherData: WeatherData? = nil, service: WeatherServiceProtocol = WeatherService()) {
        self.weatherData = weatherData
        self.service = service
    }

    func getWeatherData(for location: String) async {
        let result = await self.service.getForecast(searchTerm: location)
        await handleResult(result)
    }

    @MainActor
    private func handleResult(_ result: Result<WeatherData, NetworkError>) {
        self.weatherData = nil
        self.error = nil

        switch(result) {
        case .success(let weatherData):
            self.weatherData = weatherData
        case .failure(let error):
            self.error = error
            print(error)
        }
    }
}
