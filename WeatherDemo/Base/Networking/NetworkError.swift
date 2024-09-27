//
//  NetworkError.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidURL
    case decodeError
    case noResponse
    case unknownStatus
    case customError(infoMessage: String)
    case connectionError

    var message: String {
        switch self {
        case .invalidURL:
            return K.ErrorTexts.invalidURL
        case .decodeError:
            return K.ErrorTexts.decodeError
        case .noResponse:
            return K.ErrorTexts.noResponse
        case .customError(let infoMessage):
            return infoMessage
        case .connectionError:
            return K.ErrorTexts.connectionError
        default:
            return K.ErrorTexts.unknownError
        }
    }
}
