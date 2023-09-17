//
//  StorageClient.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 17/09/23.
//

import Foundation

protocol StorageClient {
    func save<T: Codable>(data: T, forKey: String) throws
    func get<T: Codable>(forKey: String) throws -> T?
}

extension StorageClient {
    func save<T: Codable>(data: T, forKey: String) throws {
        try UserDefaults.standard.encode(data, forKey: forKey)
    }

    func get<T: Codable>(forKey: String) throws -> T? {
        try UserDefaults.standard.decode(T.self, forKey: forKey)
    }
}

extension UserDefaults {
    func decode<T: Decodable>(_ type: T.Type, forKey defaultName: String) throws -> T {
        try JSONDecoder().decode(T.self, from: data(forKey: defaultName) ?? .init())
    }
    func encode<T: Encodable>(_ value: T, forKey defaultName: String) throws {
        try set(JSONEncoder().encode(value), forKey: defaultName)
    }
}
