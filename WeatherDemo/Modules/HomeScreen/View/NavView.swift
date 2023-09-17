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
                Image(systemName: K.SysImg.location)
                    .foregroundColor(.gray)
                    .systemImage()
            }
            .disabled(true)
            Spacer()
            VStack {
                Text(location).textFont(size: 25)
                Text(Date.now.stringFormat()).textFont()
            }
            Spacer()
            Button {
                showingSearch.toggle()
            } label: {
                Image(systemName: K.SysImg.search).systemImage()
            }
            .alert(K.Texts.enterLocation, isPresented: $showingSearch) {
                TextField(K.Texts.enterLocation, text: $searchLocation)
                    .submitLabel(.search)
                    .autocorrectionDisabled()
                Button(K.Texts.search) {
                    submit(searchLocation)
                }
            }
        }
    }
}
