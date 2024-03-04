//
//  CapitalModel.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 29/2/24.
//

import Foundation

struct Capital: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let country: String
}
