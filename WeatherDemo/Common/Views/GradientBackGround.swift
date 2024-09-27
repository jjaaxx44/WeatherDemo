//
//  GradientBackGround.swift
//  WeatherDemo
//
//  Created by Abhishek Chaudhari on 15/09/23.
//

import Foundation
import SwiftUI

struct GradientBackGround: View {
    var body: some View {
        let linGradient = LinearGradient(
            gradient: Gradient(colors: Color.dawnGradient),
            startPoint: .top,
            endPoint: .bottom
        )
        
        return Rectangle()
            .fill(linGradient)
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackGround_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GradientBackGround()
        }
    }
}
