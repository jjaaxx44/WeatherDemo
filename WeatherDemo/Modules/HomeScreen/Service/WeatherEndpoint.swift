//
//  WeatherClient.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

enum WeatherEndpoint {
    case getForecast(searchTerm: String)
}

extension WeatherEndpoint: Endpoint {
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getForecast(let searchTerm):
            return [
                URLQueryItem(name: "q", value: searchTerm),
                URLQueryItem(name: "days", value: "5")
            ]
        }
    }
    
    var path: String {
        switch self {
        case .getForecast:
            return "/forecast.json"
        }
    }
    
    var method: Method {
        switch self {
        case .getForecast:
            return .GET
        }
    }
    
    var header: [String: String]? {
        switch self {
        case .getForecast:
            return [
                "X-RapidAPI-Key": "a26a3176fcmsh6f48dbcacf88c66p16da49jsn197815e2e4a0",
                "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com"
            ]
        }
    }
}
