//
//  Import Data.swift
//  petProjectWheather
//
//  Created by Геннадий on 24.02.2025.
//

import Foundation

class ImportData {
    
    private let wheatherService = WheatherService()
    
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        wheatherService.fetchWheather(for: city) { weatherData in
            DispatchQueue.main.async {
                completion(weatherData) // Передаем данные в completion
            }
        }
    }
}
