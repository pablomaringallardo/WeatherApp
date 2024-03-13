//
//  NextForecastView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 12/3/24.
//

import SwiftUI

struct NextForecastView: View {
    @ObservedObject var viewModel: PrincipalViewModel
    var color: Color
    var daysWeek: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(color.opacity(0.3))
            .frame(width: 343, height: 460)
            .padding(.bottom)
            .overlay {
                if let weatherNF = viewModel.forecastWeather {
                    VStack {
                        HStack {
                            Text("Next Forecast")
                                .padding(.leading)
                                
                            Spacer()
                            Image(systemName: "calendar")
                                .padding(.trailing)
                        }
                        .font(.system(size: 20))
                        .bold()
                        
                        Divider()
                        
                        VStack {
                            ForEach(Array(daysWeek.enumerated()), id: \.element) { index, dayWeek in
                                TimeperDayNextForecastView(
                                    day: dayWeek,
                                    icon: weatherNF[index].weather?[0].icon ?? "",
                                    tempMin: weatherNF[index].main?.tempMin ?? 0,
                                    tempMax: weatherNF[index].main?.tempMax ?? 0)
                            }
                        }
                    }
                    .foregroundStyle(.white)
                }
            }
    }
}

#Preview {
    NextForecastView(viewModel: PrincipalViewModel(), color: Color.bgTextNight)
}
