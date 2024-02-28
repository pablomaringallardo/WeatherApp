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
    
    var suscriptors = Set<AnyCancellable>()
    var interactor: PrincipalViewInteractorProtocol
    
    init(interactor: PrincipalViewInteractorProtocol = PrincipalViewInteractor()) {
        self.interactor = interactor
    }
    
    func fetchWeather(country: String) {
        
        interactor.fetchWeather(country: country)
            .sink { completion in
                switch completion {
                case .finished:
                    print("SUCCESS")
                case .failure(let error):
                    print("ERROR \(error.localizedDescription)")
                }
            } receiveValue: { response in
                self.weatherLocation = response
                print(self.weatherLocation ?? "")
            }
            .store(in: &suscriptors)

    }
}
