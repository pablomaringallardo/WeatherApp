//
//  Globals.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation

let baseURL = "https://api.openweathermap.org/"

let apiKEY = "82ed1279a23c5e39a0598f136e6be04a"

let capitals = [
    Capital(name: "Madrid", country: "España"),
    Capital(name: "París", country: "Francia"),
    Capital(name: "Berlín", country: "Alemania"),
    Capital(name: "Londres", country: "Reino Unido"),
    Capital(name: "Roma", country: "Italia"),
    Capital(name: "Tokio", country: "Japón"),
    Capital(name: "Ottawa", country: "Canadá"),
    Capital(name: "Canberra", country: "Australia"),
    Capital(name: "Wellington", country: "Nueva Zelanda")
].sorted { $0.name < $1.name }

func iconWeather(code: String) -> String {
    switch code {
    case "01d":
        return "☀️"
    case "02d", "02n":
        return "⛅️"
    case "03d", "03n", "04d", "04n", "50d", "50n":
        return "☁️"
    case "09d", "09n":
        return "🌧️"
    case "10d", "10n":
        return "🌦️"
    case "11d", "11n":
        return "🌩️"
    case "13d", "13n":
        return "🌨️"
    case "01n":
        return "🌙"
    default:
        return "questionmark.circle"
    }
}

func kelvinToCelsius(tempKelvin: Double) -> Int {
    return Int(tempKelvin - 273.15)
}

func checkIfDayTime(sunrise: TimeInterval, sunset: TimeInterval) -> Bool {
        let currentDate = Date()
        let sunriseDate = Date(timeIntervalSince1970: sunrise)
        let sunsetDate = Date(timeIntervalSince1970: sunset)
        
        return currentDate >= sunriseDate && currentDate <= sunsetDate
    }

func convertirMetrosPorSegundoAKilometrosPorHora(velocidadEnMetrosPorSegundo: Double) -> Int {
    let velocidadEnKilometrosPorHora = velocidadEnMetrosPorSegundo * 3.6
    return Int(velocidadEnKilometrosPorHora)
}

func meterToKm(meters: Int) -> Double {
    return Double(meters/1000)
}

func getDay() -> String {
    let fecha = Date()
    let formato = DateFormatter()
    formato.locale = Locale(identifier: "es_ES") // Ajusta al locale que prefieras
    formato.dateFormat = "EEE"
    let dia = formato.string(from: fecha)
    return dia.capitalizingFirstLetter()
}

func extractDay(from dateString: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else {
            print("Error: Fecha no válida.")
            return 0
        }
        
        dateFormatter.dateFormat = "d"
        let dayString = dateFormatter.string(from: date)
        
        guard let dayInt = Int(dayString) else {
            print("Error: El día no es un número válido.")
            return 0
        }
        
        return dayInt
    }

func extractHour(from dateString: String) -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    guard let date = inputFormatter.date(from: dateString) else {
        print("Error al convertir la fecha")
        return nil
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "HH:mm"
    
    return outputFormatter.string(from: date)
}
