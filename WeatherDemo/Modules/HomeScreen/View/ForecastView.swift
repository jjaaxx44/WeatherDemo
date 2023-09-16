//
//  ForecastView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var vm: WeatherViewModel

    var body: some View {
        List {
            ForEach(vm.weatherData?.forecast.forecastday ?? []) { forecast in
                ForecastRow(vm: ForecastViewModel(dayData: forecast))
            }
        }
        .scrollContentBackground(.hidden)
        .listStyle(PlainListStyle())
    }
}
