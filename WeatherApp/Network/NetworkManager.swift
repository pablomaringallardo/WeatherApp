//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
}

struct NetworkManager {
    
    func getSession(endpoint: String) -> URLRequest? {
        
        var urlComponents = URLComponents(string: "\(baseURL)\(endpoint)")
        
        guard let url = urlComponents?.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.get.rawValue
        
        return request
    }
}
