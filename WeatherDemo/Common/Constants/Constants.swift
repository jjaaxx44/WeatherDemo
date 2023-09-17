//
//  Constants.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 17/09/23.
//

import Foundation
import SwiftUI

struct K {
    // MARK: - Texts
    struct Texts {
        static let tryAgain = "Please try again!!!"
        static let searchInfo = "Click search icon to enter your location..."
        static let enterLocation = "Enter your location"
        static let search = "Search"
        static let feelsLike = "Feels like "
    }

    struct ErrorTexts {
        static let invalidURL = "Issue with URL"
        static let decodeError = "Issue decoding json data"
        static let noResponse = "No response from server"
        static let connectionError = "Network connection issue"
        static let unknownError = "Unknown error"
    }

    struct Formats {
        static let dayShort = "EEEE, dd MMM"
        static let dateShort = "dd MMM, YYYY"
        
        static let dayOnly = "EEEE"
    }

    struct Cached {
        static let savedLocation = "SavedLocation"
    }

    // MARK: - APIs
    struct QueryItems {
        static let q = "q"
        static let days = "days"
    }

    struct Headers {
        static let key = "X-RapidAPI-Key"
        static let host = "X-RapidAPI-Host"
    }
    
    struct EndPoints {
        static let forecast = "/forecast.json"
    }

    struct Host {
        static let host = "weatherapi-com.p.rapidapi.com"
    }

    // MARK: - Assets
    struct SysImg {
        static let location = "location"
        static let search = "magnifyingglass"
        static let humidity = "humidity"
        static let wind = "wind"
        static let photo = "photo"
    }

    struct Colors {
        static let purple = Color(red: 86/255, green: 0/255, blue: 149/255)
        static let yellow = Color(red: 236/255, green: 170/255, blue: 8/255)
    }
}
