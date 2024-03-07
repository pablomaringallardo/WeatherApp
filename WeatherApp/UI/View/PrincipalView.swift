//
//  PrincipalView.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import SwiftUI

struct PrincipalView: View {
    
    @StateObject var viewModel = PrincipalViewModel()
    @State var capitalSelected: String = ""
    @State var countryText: String = ""
    var body: some View {
        ZStack {
            if let weatherLocation = viewModel.weatherLocation {
                let isDayTime = checkIfDayTime(sunrise: TimeInterval(weatherLocation.sys?.sunrise ?? 0), sunset: TimeInterval(weatherLocation.sys?.sunset ?? 0))
                
                (isDayTime ? Color.backgroundDay : Color.backgroundNight)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        VStack(spacing: 12) {
                            Image(systemName: iconWeather(code: weatherLocation.weather?[0].icon ?? ""))
                                .resizable()
                                .frame(width: 190, height: 160)
                                .padding(.top)
                            
                            Text(capitalSelected)
                                .font(.system(size: 50))
                                
                                .padding(.top)
                            
                            let tempC = kelvinToCelsius(tempKelvin: weatherLocation.main?.temp ?? 0.0)
                            
                            Text("\(Int(tempC))°")
                                .font(.system(size: 64))
                            
                            VStack {
                                Text(weatherLocation.weather?[0].main ?? "")
                                    .font(.system(size: 18))
                                
                                let tempMaxC = kelvinToCelsius(tempKelvin: weatherLocation.main?.tempMax ?? 0)
                                let tempMinC = kelvinToCelsius(tempKelvin: weatherLocation.main?.tempMin ?? 0)
                                
                                Text("Max.: \(Int(tempMaxC))° | Min.: \(Int(tempMinC))°")
                            }
                        }
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        WeatherConditionsView(
                            color: (isDayTime ? Color.bgTextDay : Color.bgTextNight), visibility: meterToKm(meters: weatherLocation.visibility ?? 0),
                            humidity: weatherLocation.main?.humidity,
                            wind: weatherLocation.wind?.speed)
                        .padding(.top)
                        
                        TodayTimeView(viewModel: viewModel, color: (isDayTime ? Color.bgTextDay : Color.bgTextNight))
                    }
                }
                .offset(y: 50)
                DropDownCustom(prompt: "Selecciona una capital", options: capitals, isDay: isDayTime, selection: $capitalSelected)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .onChange(of: capitalSelected) {
                        viewModel.fetchWeather(capital: capitalSelected)
                        viewModel.fetchCityWeatherForecast(ubication: capitalSelected)
                    }
                
                
            }
        }
    }
}

#Preview {
    PrincipalView(viewModel: PrincipalViewModel())
}
