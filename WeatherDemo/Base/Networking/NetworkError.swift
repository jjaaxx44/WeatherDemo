//
//  NetworkError.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodeError
    case noResponse
    case unknownStatus
    case authError
    
    var message: String {
        switch self {
        case .invalidURL:
            return "Issue with URL"
        case .decodeError:
            return "Issue decoding json data"
        case .noResponse:
            return "No response from server"
        case .authError:
            return "Authentication error"
        default:
            return "Unknown error"
        }
    }
}
