//
//  ForecastViewModelTests.swift
//  WeatherDemoTests
//
//  Created by Abhishek Chaudhari on 17/09/23.
//

import XCTest
@testable import WeatherDemo

final class ForecastViewModelTests: XCTestCase {

    func testVMComputedValues() {
        let sut = ForecastViewModel(dayData: (WeatherData.mockData()?.forecast.forecastday.first)!)
        XCTAssertEqual(sut.dayFormat, "Saturday")
        XCTAssertEqual(sut.dateFormat, "16 Sep, 2023")
        XCTAssertEqual(sut.temprature, "22.7\u{00B0}")
        XCTAssertEqual(sut.currentCondition, "Partly cloudy")
        XCTAssertTrue(sut.currentConditionIcon.contains("https://"))
    }
}
