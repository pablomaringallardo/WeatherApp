//
//  PrincipalViewInteractor.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
import Combine

protocol PrincipalViewInteractorProtocol: AnyObject {
    func fetchWeather(capital: String) -> AnyPublisher<WeatherModel, Error>
    func fetchCityWeatherForecast(ubication: String) -> AnyPublisher<ForecastWeatherModel, Error>
}

final class PrincipalViewInteractor: PrincipalViewInteractorProtocol {
    
    let networker = Networker()
    let networkManager = NetworkManager()
    
    func fetchWeather(capital: String) -> AnyPublisher<WeatherModel, Error> {
        
        let endpoint = "data/2.5/weather?q=\(capital)&APPID=\(apiKEY)"
        
        return networker.callServer(type: WeatherModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func fetchCityWeatherForecast(ubication: String) -> AnyPublisher<ForecastWeatherModel, Error> {
        
        let endpoint = "data/2.5/forecast?q=\(ubication)&appid=82ed1279a23c5e39a0598f136e6be04a"
        
        return networker.callServer(type: ForecastWeatherModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
}
