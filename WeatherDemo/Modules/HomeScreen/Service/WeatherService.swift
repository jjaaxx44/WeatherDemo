//
//  WeatherService.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

protocol WeatherServiceProtocol: NetworkClient {
    func getForecast(searchTerm: String) async -> Result<WeatherData, NetworkError>
}

struct WeatherService: WeatherServiceProtocol {
    func getForecast(searchTerm: String) async -> Result<WeatherData, NetworkError> {
        return await getRequest(endpoint: WeatherEndpoint.getForecast(searchTerm: searchTerm),
                                responseType: WeatherData.self)
    }
}
