//
//  PrincipalViewInteractor.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
import Combine

protocol PrincipalViewInteractorProtocol: AnyObject {
    func fetchWeather(country: String) -> AnyPublisher<WeatherModel, Error>
}

final class PrincipalViewInteractor: PrincipalViewInteractorProtocol {
    
    let networker = Networker()
    let networkManager = NetworkManager()
    
    func fetchWeather(country: String) -> AnyPublisher<WeatherModel, Error> {
        
        let endpoint = "data/2.5/weather?q=\(country)&APPID=\(apiKEY)"
        
        return networker.callServer(type: WeatherModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }

}
