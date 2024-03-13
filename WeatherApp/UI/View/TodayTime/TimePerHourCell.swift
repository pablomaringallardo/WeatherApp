//
//  TimePerHourCell.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 6/3/24.
//

import SwiftUI

struct TimePerHourCell: View {
    var icon: String
    var temp: Int
    var hour: String
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("\(temp)°C")
                    .font(.system(size: 18))
                    
                Text("\(iconWeather(code: icon))")
                    .font(.largeTitle)
                
                Text(hour)
                    .font(.system(size: 18))
            }
        }
        .frame(width: 70, height: 155)
        .foregroundStyle(.white)
    }
}

#Preview {
    TimePerHourCell(icon: "10d", temp: 15, hour: "21:00")
        .background(.black)
}
