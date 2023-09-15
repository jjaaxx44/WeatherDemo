//
//  EndPoint.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: Method { get }
    var header: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "WeatherAPI.com" //https://weatherapi-com.p.rapidapi.com/forecast.json?q=Pune
    }

    var method: Method {
        .GET
    }
}

enum Method: String {
    case GET
    case POST
}
