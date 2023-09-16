//
//  HeaderView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var vm: WeatherViewModel

    var body: some View {
        VStack(spacing: 0) {
            asyncImage(vm.currentConditionIcon ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            HStack {
                Text(vm.currentCondition + ", " + vm.currentTemp)
                    .textFont(size: 100, color: .white, isBold: true)
                    .minimumScaleFactor(0.1)
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
            }
            Text("Feels like " + vm.feelsLikeTemp)
                .textFont(size: 25, color: .white, isBold: true)
        }
        .frame(maxHeight: .infinity)
    }
}

