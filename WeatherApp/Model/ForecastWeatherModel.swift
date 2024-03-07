//
//  ForecastWeatherModel.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 7/3/24.
//

import Foundation

// MARK: - APIResponseModel
struct ForecastWeatherModel: Codable {
    let cod: String?
    let message: Int?
    let cnt: Int?
    let list: [Forecast]?
    let city: City?
}

// MARK: - Forecast
struct Forecast: Codable {
    
    let dt: Int?
    let main: ForecastMain?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let rain: Rain?
    let sys: ForecastSys?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - ForecastMain
struct ForecastMain: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - ForecastSys
struct ForecastSys: Codable {
    let pod: String?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone: Int?
    let sunrise, sunset: Int?
}
