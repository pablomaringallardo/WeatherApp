//
//  PrincipalView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import SwiftUI

struct PrincipalView: View {
    
    @StateObject var viewModel = PrincipalViewModel()
    @State var countryText: String = ""
    var isDay: Bool {
            let hour = Calendar.current.component(.hour, from: Date())
            return hour > 6 && hour < 19
        }
    var body: some View {
        ZStack {
            if isDay {
                Color.backgroundDay
                    .ignoresSafeArea()
            } else {
                Color.backgroundNight
                    .ignoresSafeArea()
            }
        }
        
        VStack {
            TextField(text: $countryText) {
                Text("ciudad,pais")
            }
            
            Button(action: {
                viewModel.fetchWeather(country: countryText)
            }, label: {
                Text("buscar")
            })
        }
        
    }
}

#Preview {
    PrincipalView()
}
