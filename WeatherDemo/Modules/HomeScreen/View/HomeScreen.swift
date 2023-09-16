//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var vm: WeatherViewModel
    @State private var isLoading = false

    init(vm: WeatherViewModel = WeatherViewModel()) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        ZStack {
            GradientBackGround()
            VStack {
                NavView(location: vm.location,
                        submit: submit)
                if isLoading {
                    activityIndicator()
                } else if vm.error != nil {
                    infoView(vm.error?.message ?? "Please try again!!!")
                } else if vm.weatherData == nil {
                    infoView("Click search icon to enter your location...")
                } else {
                    HeaderView(vm: vm)
                    Spacer()
                    ForecastView(vm: vm)
                        .padding(.vertical)
                }
            }
            .padding()
        }
    }
    
    func submit(searchLocation: String) {
        Task {
            isLoading.toggle()
            await vm.getWeatherData(for: searchLocation)
            isLoading.toggle()
        }
    }

    func activityIndicator() -> some View {
        VStack {
            Spacer()
            ProgressView()
                .controlSize(.large)
                .tint(.white)
            Spacer()
        }
    }
    func infoView(_ message: String) -> some View {
        VStack {
            Spacer()
            Text(message)
                .multilineTextAlignment(.center)
                .textFont(size: 18)
            Spacer()
        }
    }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(vm: WeatherViewModel(weatherData: nil))
//        HomeScreen(vm: WeatherViewModel(weatherData: WeatherData.mockData()))
    }
}
