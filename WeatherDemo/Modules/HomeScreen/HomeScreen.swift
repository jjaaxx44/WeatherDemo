//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var vm = WeatherViewModel()
    @State private var showingSearch = false
    @State private var searchLocation = ""
    
    
    var body: some View {
        ZStack {
            GradientBackGround()
            VStack {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "location")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Weather App")
                        .font(.system(size: 20).bold())
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        showingSearch.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                    .alert("Enter your location", isPresented: $showingSearch) {
                        TextField("Enter your location", text: $searchLocation)
                            .submitLabel(.search)
                    }
                }
                .padding(.all)
                Spacer()
            }
            VStack {
                if vm.weatherData != nil {
                    Text("\(vm.weatherData?.current.tempC ?? 0)")
                }
            }
            .padding()
        }
    }
    
    func submit() {
        Task {
            await vm.getWeatherData(for: searchLocation)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
