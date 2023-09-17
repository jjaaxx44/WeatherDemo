//
//  ForecastViewModel.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import Foundation

class ForecastViewModel: ObservableObject {
    let dayData: Forecastday
    
    var dayFormat: String {
        Date(timeIntervalSince1970: TimeInterval(dayData.dateEpoch))
            .stringFormat(format: K.Formats.dayOnly)
    }
    
    var dateFormat: String {
        Date(timeIntervalSince1970: TimeInterval(dayData.dateEpoch))
            .stringFormat(format: K.Formats.dateShort)
    }

    var temprature: String {
        return "\(String(format: "%.1f\u{00B0}", dayData.day.avgtempC))"
    }

    var currentCondition: String {
        dayData.day.condition.text
    }

    var currentConditionIcon: String {
        dayData.day.condition.icon
            .replacingOccurrences(of: "//", with: "https://")
    }
    
    init(dayData: Forecastday) {
        self.dayData = dayData
    }
}
