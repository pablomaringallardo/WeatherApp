//
//  PrincipalViewModel.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
import Combine

final class PrincipalViewModel: ObservableObject {
    @Published var weatherLocation: WeatherModel?
    @Published var forecastWeather: [Forecast]?
    
    var suscriptors = Set<AnyCancellable>()
    var interactor: PrincipalViewInteractorProtocol
    
    init(interactor: PrincipalViewInteractorProtocol = PrincipalViewInteractor()) {
        self.interactor = interactor
        fetchWeather(capital: "Berlín")
        fetchCityWeatherForecast(ubication: "Berlín")
    }
    
    func fetchWeather(capital: String) {
        
        interactor.fetchWeather(capital: capital)
            .sink { completion in
                switch completion {
                case .finished:
                    print("SUCCESS FETCH WEATHER")
                case .failure(let error):
                    print("ERROR \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.weatherLocation = response
            }
            .store(in: &suscriptors)

    }
    
    func fetchCityWeatherForecast(ubication: String) {
        
        interactor.fetchCityWeatherForecast(ubication: ubication)
            .sink { completion in
                switch completion {
                case .finished:
                    print("SUCCESS FORECAST")
                case .failure(let error):
                    print("ERROR \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.forecastWeather = response.list
            }
            .store(in: &suscriptors)

    }
}
