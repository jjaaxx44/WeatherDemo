//
//  ForecastRow.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import SwiftUI

struct ForecastRow: View {
    let vm: ForecastViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(vm.dayFormat)
                    .textFont()
                Text(vm.dateFormat)
                    .textFont(size: 13,
                              color: .white.opacity(0.7))
            }
            Spacer()
            asyncImage(vm.currentConditionIcon)
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
            Text(vm.temprature)
                .textFont()
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .padding(.vertical, 10)
    }
}

