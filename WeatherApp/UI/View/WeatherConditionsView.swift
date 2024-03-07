//
//  WeatherConditionsView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 4/3/24.
//

import SwiftUI

struct WeatherConditionsView: View {
    var color: Color
    var visibility: Double?
    var humidity: Int?
    var wind: Double?
    var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 343, height: 47)
                .foregroundStyle(color.opacity(0.3))
                .overlay {
                    HStack(spacing: 50) {
                        HStack {
                            Image(systemName: "eye.fill")
                            if let visibility {
                                Text("\(Int(visibility).formatted(.percent))")
                            } else {
                                Text("--")
                            }
                        }
                        
                        HStack {
                            Image(.iconHumidity)
                            if let humidity {
                                Text(humidity.formatted(.percent))
                            } else {
                                Text("--")
                            }
                        }
                        
                        HStack {
                            Image(.iconWind)
                            if let wind {
                                let windKmH = convertirMetrosPorSegundoAKilometrosPorHora(velocidadEnMetrosPorSegundo: wind)
                                Text("\(windKmH)km/h")
                            } else {
                                Text("--")
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                }
            
            
        
    }
}

#Preview {
    WeatherConditionsView(color: Color.bgTextNight, visibility: 15, humidity: 70, wind: 4)
}
