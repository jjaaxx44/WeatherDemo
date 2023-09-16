//
//  ViewExt.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 16/09/23.
//

import SwiftUI

extension View {
    func systemImage() -> some View {
        self
            .font(.system(size: 25))
            .foregroundColor(.white)
    }

    func textFont(size: CGFloat = 20,
                  color: Color = .white,
                  isBold: Bool = true) -> some View {
        self
            .font(.system(size: size))
            .foregroundColor(color)
            .bold(isBold)
    }

    func asyncImage(_ url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
            } else if phase.error != nil {
                Image(systemName: "photo")
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
        }
    }
}
