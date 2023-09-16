//
//  NetworkClient.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

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
            case 401:
                return .failure(.authError)
                
            case 200...299:
                guard let responseModel = try? JSONDecoder().decode(responseType, from: data) else {
                    return .failure(.decodeError)
                }
                return .success(responseModel)
                
            default:
                return .failure(.unknownStatus)
            }
        } catch {
            return .failure(.unknownStatus)
        }
    }
}
