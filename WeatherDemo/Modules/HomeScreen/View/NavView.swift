//
//  TopView.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import SwiftUI

struct NavView: View {
    @State private var showingSearch: Bool = false
    @State private var searchLocation: String = ""

    let location: String
    var submit: ((String) -> Void)

    var body: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: "location").systemImage()                    }
            Spacer()
            VStack {
                Text(location).textFont(size: 25)
                Text(Date.now.stringFormat()).textFont()
            }
            Spacer()
            Button {
                showingSearch.toggle()
            } label: {
                Image(systemName: "magnifyingglass").systemImage()
            }
            .alert("Enter your location", isPresented: $showingSearch) {
                TextField("Enter your location", text: $searchLocation)
                    .submitLabel(.search)
                    .autocorrectionDisabled()
                Button("Search") {
                    submit(searchLocation)
                }
            }
        }
    }
}
