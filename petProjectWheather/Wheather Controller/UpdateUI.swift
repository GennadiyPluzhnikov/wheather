import Foundation
import UIKit

// MARK: - Обновляем/Добавляем данные на экране
class UpdateUI {
    
    weak var wheatherController: WheatherController?
    let convertData = ConvertData()
    let blocks = Blocks()
    var backgroundImage: BackgroundImage?
    
    init(wheatherController: WheatherController) {
        self.wheatherController = wheatherController
        self.backgroundImage = BackgroundImage(wheatherController: wheatherController)
    }
    
    func updateUI(with weatherData: WeatherResponse) {
        
        guard let wheatherController = wheatherController else { return }
        
        print("Данные о погоде получены в методе UpdateUI: \(weatherData)")
        
        // Очистить блоки перед добавлением новых данных
        wheatherController.cloudsBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.pressureBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.humidityBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.feelsTemperatureBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.speedWindBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.gustWindBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.sunriseBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wheatherController.sunsetBlock.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Добавление значений на экран
        wheatherController.cityLabel.text = "\(weatherData.name)"
        
        let roundedTemp = Int(round(weatherData.main.temp))
        wheatherController.temperatureLabel.text = "\(roundedTemp)°C"
        
        wheatherController.descriptionLabel.text = "\(weatherData.weather.first?.description ?? "")"
        
        wheatherController.clouds.text = "  Облачность\n"
        wheatherController.cloudsValue.text = "  \(weatherData.clouds.all)%"
        
        wheatherController.pressure.text = "  Давление\n"
        wheatherController.pressureValue.text = "  \(weatherData.main.pressure) гПа"
        
        wheatherController.humidity.text = "  Влажность\n"
        wheatherController.humidityValue.text = "  \(weatherData.main.humidity)%"
        
        let roundedFeelsTemp = Int(round(weatherData.main.feels_like))
        wheatherController.feelsTemperature.text = "  Ощущается как\n"
        wheatherController.feelsTemperatureValue.text = "  \(roundedFeelsTemp)°C"
        
        let roundedSpeedWind = Int(round(weatherData.wind.speed))
        wheatherController.speedWind.text = "  Скорость ветра\n"
        wheatherController.speedWindValue.text = "  \(roundedSpeedWind) м/с"
        
        if let gust = weatherData.wind.gust {
            let roundedGustWind = Int(round(gust))
            wheatherController.gustWind.text = "  Порыв ветра\n"
            wheatherController.gustWindValue.text = "  \(roundedGustWind) м/с"
        } else {
            wheatherController.gustWind.text = "  Порыв ветра\n"
            wheatherController.gustWindValue.text = "  Н/Д" // Нет данных
        }
        
        let normTimeSunrise = convertData.convertUnixTimestampToReadableTime(unixTime: TimeInterval(weatherData.sys.sunrise))
        wheatherController.timeSunrise.text = "  Время рассвета\n"
        wheatherController.timeSunriseValue.text = "  \(normTimeSunrise)"
        
        let normTimeSunset = convertData.convertUnixTimestampToReadableTime(unixTime: TimeInterval(weatherData.sys.sunset))
        wheatherController.timeSunset.text = "  Время заката\n"
        wheatherController.timeSunsetValue.text = "  \(normTimeSunset)"
        
        print("Данные для экрана добавлены/обновлены")
        
        // Обновляем фоновое изображение
        backgroundImage?.updateBackgroundImage(with: weatherData)
        print("Фоновое изображение добавлено/обновлено")
        
        
        // Собираем данные в блоки на экране
        wheatherController.cloudsBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.clouds.text ?? "Нет данных")",
            value: "\(wheatherController.cloudsValue.text ?? "Нет данных")",
            iconName: "Облачность"))
        
        wheatherController.pressureBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.pressure.text ?? "Нет данных")",
            value: "\(wheatherController.pressureValue.text ?? "Нет данных")",
            iconName: "Давление"))
        wheatherController.humidityBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.humidity.text ?? "Нет данных")",
            value: "\(wheatherController.humidityValue.text ?? "Нет данных")",
            iconName: "Влажность"))
        wheatherController.feelsTemperatureBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.feelsTemperature.text ?? "Нет данных")",
            value: "\(wheatherController.feelsTemperatureValue.text ?? "Нет данных")",
            iconName: "Температура"))
        wheatherController.speedWindBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.speedWind.text ?? "Нет данных")",
            value: "\(wheatherController.speedWindValue.text ?? "Нет данных")",
            iconName: "Скорость ветра"))
        wheatherController.gustWindBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.gustWind.text ?? "Нет данных")",
            value: "\(wheatherController.gustWindValue.text ?? "Нет данных")",
            iconName: "Порыв ветра"))
        wheatherController.sunriseBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.timeSunrise.text ?? "Нет данных")",
            value: "\(wheatherController.timeSunriseValue.text ?? "Нет данных")",
            iconName: "Восход"))
        wheatherController.sunsetBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.timeSunset.text ?? "Нет данных")",
            value: "\(wheatherController.timeSunsetValue.text ?? "Нет данных")",
            iconName: "Закат"))
        
    }
}
