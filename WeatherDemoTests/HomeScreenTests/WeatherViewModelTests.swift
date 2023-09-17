//
//  WeatherDemoTests.swift
//  WeatherDemoTests
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import XCTest
@testable import WeatherDemo

final class WeatherViewModelTests: XCTestCase {
    let mockData = WeatherData.mockData()
    let mockService = MockWeatherService()
    var sut: WeatherViewModel!
    var emptysut: WeatherViewModel!

    override func setUp() {
        super.setUp()
        sut = WeatherViewModel(weatherData: mockData,
                               service: mockService)
        emptysut = WeatherViewModel(weatherData: nil,
                                    service: mockService)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInit() {
        XCTAssertNotNil(sut.weatherData)
        XCTAssertNil(emptysut.weatherData)
    }

    func testVMComputedValues() {
        XCTAssertEqual(sut.location, "Pune")
        XCTAssertEqual(sut.currentTemp, "24.1\u{00B0}")
        XCTAssertEqual(sut.feelsLikeTemp, "26.0\u{00B0}")
        XCTAssertEqual(sut.humidity, "79%")
        XCTAssertEqual(sut.wind, "21.6 kph")
        XCTAssertEqual(sut.currentCondition, "Partly cloudy")
        XCTAssertTrue(sut.currentConditionIcon!.contains("https://"))
        XCTAssertFalse(sut.forecast.isEmpty)
        
        XCTAssertEqual(emptysut.location, "")
        XCTAssertEqual(emptysut.currentTemp, "-\u{00B0}")
        XCTAssertEqual(emptysut.feelsLikeTemp, "-\u{00B0}")
        XCTAssertEqual(emptysut.humidity, "0%")
        XCTAssertEqual(emptysut.wind, "0.0 kph")
        XCTAssertEqual(emptysut.currentCondition, "-")
        XCTAssertNil(emptysut.currentConditionIcon)
        XCTAssertTrue(emptysut.forecast.isEmpty)
    }

    func testGetWeatherData_success() async {
        MockWeatherService.isSuccess = true
        await emptysut.getWeatherData(for: "")
        XCTAssertNotNil(emptysut.weatherData)
        XCTAssertNil(emptysut.error)
    }

    func testGetWeatherData_failure() async {
        MockWeatherService.isSuccess = false
        await emptysut.getWeatherData(for: "")
        XCTAssertNil(emptysut.weatherData)
        XCTAssertNotNil(emptysut.error)
    }
}

struct MockWeatherService: WeatherServiceProtocol {
    static var isSuccess: Bool = false

    func getForecast(searchTerm: String) async -> Result<WeatherDemo.WeatherData, WeatherDemo.NetworkError> {
        if MockWeatherService.isSuccess {
            return .success(WeatherData.mockData()!)
        } else {
            return .failure(.customError(infoMessage: "Dummy Error"))
        }
    }
}
