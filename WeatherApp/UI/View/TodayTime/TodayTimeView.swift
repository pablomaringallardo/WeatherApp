//
//  TodayTimeView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 5/3/24.
//

import SwiftUI

struct TodayTimeView: View {
    @ObservedObject var viewModel: PrincipalViewModel
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 343, height: 217)
            .foregroundStyle(color.opacity(0.3))
            .overlay {
                if let weather = viewModel.forecastWeather {
                    VStack {
                        HStack {
                            Text("Today")
                                .padding(.leading)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            Text("\(getDay()), \(extractDay(from: weather[0].dtTxt ?? ""))")
                                .padding(.trailing)
                                .font(.system(size: 18))
                            
                        }
                        .foregroundStyle(.white)
                        .padding(.top)
                        .bold()
                        
                        Divider()
                        
                        HStack {
                            TimePerHourCell(
                                icon: weather[0].weather?[0].icon ?? "",
                                temp: kelvinToCelsius(tempKelvin: weather[0].main?.temp ?? 0.0),
                                hour: extractHour(from: weather[0].dtTxt ?? "") ?? "")
                            
                            TimePerHourCell(
                                icon: weather[1].weather?[0].icon ?? "",
                                temp: kelvinToCelsius(tempKelvin: weather[1].main?.temp ?? 0.0),
                                hour: extractHour(from: weather[1].dtTxt ?? "") ?? "")
                            
                            TimePerHourCell(
                                icon: weather[2].weather?[0].icon ?? "",
                                temp: kelvinToCelsius(tempKelvin: weather[2].main?.temp ?? 0.0),
                                hour: extractHour(from: weather[2].dtTxt ?? "") ?? "")
                            
                            TimePerHourCell(
                                icon: weather[3].weather?[0].icon ?? "",
                                temp: kelvinToCelsius(tempKelvin: weather[3].main?.temp ?? 0.0),
                                hour: extractHour(from: weather[3].dtTxt ?? "") ?? "")
                        }
                        
                        
                        
                        
                    }
                }
            }
    }
}
#Preview {
    TodayTimeView(viewModel: PrincipalViewModel(), color: Color.bgTextNight)
}
