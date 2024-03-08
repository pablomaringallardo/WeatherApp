//
//  Globals.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 27/2/24.
//

import Foundation
let hola = "Hola"
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
        return "sun.max.fill"
    case "02d", "02n":
        return "cloud.sun.fill"
    case "03d", "03n":
        return "cloud.fill"
    case "04d", "04n":
        return "cloud.fill"
    case "09d", "09n":
        return "cloud.rain.fill"
    case "10d", "10n":
        return "cloud.sun.rain.fill"
    case "11d", "11n":
        return "cloud.bolt.fill"
    case "13d", "13n":
        return "cloud.snow.fill"
    case "50d", "50n":
        return "cloud.fog.fill"
    case "01n":
        return "moon.fill"
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
