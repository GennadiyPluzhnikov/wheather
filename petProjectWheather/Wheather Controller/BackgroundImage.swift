//
//  backgroundImage.swift
//  petProjectWheather
//
//  Created by Геннадий on 24.02.2025.
//

import Foundation
import UIKit

// MARK: - Логика присвоения картинки для заднего фона
class BackgroundImage {
    
    weak var wheatherController: WheatherController?

    init(wheatherController: WheatherController) {
        self.wheatherController = wheatherController
    }
    
    func backgroundImage(with weatherData: WeatherResponse) -> String {
        guard let currentWeather = weatherData.weather.first?.main else {
            return "backgroundImage - 5" // Имя изображения по умолчанию
        }
        
        switch currentWeather {
        case "Rain": return "Дождь"
        case "Snow": return "Снег"
        case "Clouds": return "Облачно"
        default: return "Солнечно"
        }
    }
    
    func updateBackgroundImage(with weatherData: WeatherResponse) {
        let imageName = backgroundImage(with: weatherData) // Получаем имя изображения
        wheatherController!.backgroundImageView.image = UIImage(named: imageName) // Устанавливаем изображение
    }
    
}
