//
//  TimeperDayNextForecastView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 12/3/24.
//

import SwiftUI

struct TimeperDayNextForecastView: View {
    var day: String
    var icon: String
    var tempMin: Double
    var tempMax: Double
    var body: some View {
        HStack(alignment: .center) {
            Text(day)
                .font(.system(size: 18))
                .frame(maxWidth: 40)
                .bold()
            Spacer()
            Text(iconWeather(code: icon))
                .frame(width: 50)
            
            Spacer()
            HStack {
                Text("\(kelvinToCelsius(tempKelvin:tempMax))°C")
                    
                Text("\(kelvinToCelsius(tempKelvin:tempMin))°C")
                    .opacity(0.5)
            }
            .bold()
            .frame(maxWidth: 94)
        }
        .frame(width: 309, height: 50)
        .foregroundStyle(.white)
    }
}

#Preview {
    TimeperDayNextForecastView(day: "Monday", icon: "☀️", tempMin: 286.09, tempMax: 286.49)
}
