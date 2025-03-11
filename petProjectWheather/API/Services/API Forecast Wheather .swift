//
//  API Forecast Wheather .swift
//  petProjectWheather
//
//  Created by Геннадий on 18.02.2025.
//

import Foundation


class WheatherForecastService {
    let apiKey = "f48ab01f756e4002b3e61154250403"

    func fetchWeatherForecast(for city: String, days: Int, completion: @escaping (ForecastWeatherAPI.ForecastResponse?) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=\(days)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // Получение данных и декодировка ответа
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }

            do {
                let wheatherForecastResponse = try JSONDecoder().decode(ForecastWeatherAPI.ForecastResponse.self, from: data)
                completion(wheatherForecastResponse)
                print(wheatherForecastResponse)
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

