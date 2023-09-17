//
//  NetworkClient.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

// protocol

import Foundation

protocol NetworkClient {
    func getRequest<T: Codable>(
        session: URLSession,
        endpoint: Endpoint,
        responseType: T.Type
    ) async -> Result<T, NetworkError>
}


extension NetworkClient {
    func getRequest<T: Codable>(
        session: URLSession = .shared,
        endpoint: Endpoint,
        responseType: T.Type
    ) async -> Result<T, NetworkError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        do {
            let (data, response) = try await session.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let responseModel = try? JSONDecoder().decode(responseType, from: data) else {
                    return .failure(.decodeError)
                }
                return .success(responseModel)
                
            default:
                guard let errorInfo = try? JSONDecoder().decode(WeatherError.self, from: data) else {
                    return .failure(.unknownStatus)
                }
                return .failure(.customError(infoMessage: errorInfo.error.message))
            }
        } catch {
            print("error: ", error)
            return .failure(.decodeError)
        }
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
