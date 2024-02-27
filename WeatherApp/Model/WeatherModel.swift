//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation

struct WeatherModel: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let timezoneOffset: Int64
    var current: CurrentWeather
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
    }
}

struct CurrentWeather: Codable {
    let date: Int
    let sunrise: Int
    let sunset: Int
    let temperature: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvIndex: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDegrees: Int
    let windGust: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case sunrise
        case sunset
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvIndex = "uvi"
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDegrees = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
