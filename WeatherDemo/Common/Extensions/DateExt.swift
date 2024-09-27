//
//  DateExt.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import Foundation

extension Date {
    func stringFormat(format : String = K.Formats.dayShort) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
