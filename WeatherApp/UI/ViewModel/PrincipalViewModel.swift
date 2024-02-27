//
//  PrincipalViewModel.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
import Combine

final class PrincipalViewModel: ObservableObject {
    @Published var weatherLocation: WeatherModel
    
    var suscriptors = Set<AnyCancellable>()
    var interactor: PrincipalViewInteractor
    
    init(weatherLocation: WeatherModel, interactor: PrincipalViewInteractor) {
        self.weatherLocation = weatherLocation
        self.interactor = interactor
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        
        interactor.fetchWeather(latitude: latitude, longitude: longitude)
            .sink { completion in
                switch completion {
                case .finished:
                    print("SUCCESS")
                case .failure(let error):
                    print("ERROR")
                }
            } receiveValue: { response in
                self.weatherLocation = response
            }
            .store(in: &suscriptors)

    }
}
