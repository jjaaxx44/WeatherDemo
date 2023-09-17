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
        VStack(spacing: 10) {
            asyncImage(vm.currentConditionIcon ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            HStack {
                Text(vm.currentCondition + ", " + vm.currentTemp)
                    .textFont(size: 100)
                    .minimumScaleFactor(0.1)
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
            }
            Text(K.Texts.feelsLike + vm.feelsLikeTemp)
                .textFont(color: .white.opacity(0.7),
                          isBold: false)
            HStack {
                Spacer()
                Image(systemName: K.SysImg.humidity)
                    .foregroundColor(.white.opacity(0.7))
                    .systemImage()
                Text(vm.humidity)
                    .textFont(color: .white.opacity(0.7),
                              isBold: false)
                Spacer()
                Image(systemName: K.SysImg.wind)
                    .foregroundColor(.white.opacity(0.7))
                    .systemImage()
                Text(vm.wind)
                    .textFont(color: .white.opacity(0.7),
                              isBold: false)
                Spacer()
            }
        }
        .frame(maxHeight: .infinity)
    }
}

