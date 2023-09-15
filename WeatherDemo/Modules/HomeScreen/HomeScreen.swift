//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            GradientBackGround()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
