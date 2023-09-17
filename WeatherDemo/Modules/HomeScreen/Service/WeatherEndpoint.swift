//
//  WeatherClient.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

fileprivate let APIKey = "a26a3176fcmsh6f48dbcacf88c66p16da49jsn197815e2e4a0"

enum WeatherEndpoint {
    case getForecast(searchTerm: String)
}

extension WeatherEndpoint: Endpoint {
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getForecast(let searchTerm):
            return [
                URLQueryItem(name: K.QueryItems.q, value: searchTerm),
                URLQueryItem(name: K.QueryItems.days, value: "5")
            ]
        }
    }
    
    var path: String {
        switch self {
        case .getForecast:
            return K.EndPoints.forecast
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
                K.Headers.key: APIKey,
                K.Headers.host: K.Host.host
            ]
        }
    }
}
