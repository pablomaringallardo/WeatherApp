//
//  PrincipalViewInteractor.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
import Combine

protocol PrincipalViewInteractorProtocol: AnyObject {
    func fetchWeather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherModel, Error>
}

final class PrincipalViewInteractor: PrincipalViewInteractorProtocol {
    
    let networker = Networker()
    let networkManager = NetworkManager()
    
    func fetchWeather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherModel, Error> {
        
        let endpoint = "?lat=\(latitude)&lon=\(longitude)&appid=\(apiKEY)"
        
        return networker.callServer(type: WeatherModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }

}
