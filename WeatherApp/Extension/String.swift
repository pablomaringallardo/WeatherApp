//
//  String.swift
//  WeatherApp
//
//  Created by Pablo Marín Gallardo on 7/3/24.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
