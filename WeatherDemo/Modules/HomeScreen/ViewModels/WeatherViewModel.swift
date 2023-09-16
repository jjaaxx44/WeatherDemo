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

    init(weatherData: WeatherData? = nil, service: WeatherService = WeatherService()) {
        self.weatherData = weatherData
        self.service = service
        Task { await getWeatherData(for: "Kochi") }
    }

    @MainActor
    func getWeatherData(for location: String) async {
        let result = await self.service.getForecast(searchTerm: location)
        switch(result) {
        case .success(let weatherData):
            self.weatherData = weatherData
        case .failure(let error):
            print(error)
        }
    }
}
