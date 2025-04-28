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
        wheatherController.mainLabels.cityLabel.text = "\(weatherData.name)"
        
        let roundedTemp = Int(round(weatherData.main.temp))
        wheatherController.mainLabels.temperatureLabel.text = "\(roundedTemp)°C"
        
        wheatherController.mainLabels.descriptionLabel.text = "\(weatherData.weather.first?.description ?? "")"
        
        wheatherController.cloudsBlock.titleLabel.text = "  Облачность\n"
        wheatherController.cloudsBlock.valueLabel.text = "  \(weatherData.clouds.all)%"
        
        wheatherController.pressureBlock.titleLabel.text = "  Давление\n"
        wheatherController.pressureBlock.valueLabel.text = "  \(weatherData.main.pressure) гПа"
        
        wheatherController.humidityBlock.titleLabel.text = "  Влажность\n"
        wheatherController.humidityBlock.valueLabel.text = "  \(weatherData.main.humidity)%"
        
        let roundedFeelsTemp = Int(round(weatherData.main.feels_like))
        wheatherController.feelsTemperatureBlock.titleLabel.text = "  Ощущается как\n"
        wheatherController.feelsTemperatureBlock.valueLabel.text = "  \(roundedFeelsTemp)°C"
        
        let roundedSpeedWind = Int(round(weatherData.wind.speed))
        wheatherController.speedWindBlock.titleLabel.text = "  Скорость ветра\n"
        wheatherController.speedWindBlock.valueLabel.text = "  \(roundedSpeedWind) м/с"
        
        if let gust = weatherData.wind.gust {
            let roundedGustWind = Int(round(gust))
            wheatherController.gustWindBlock.titleLabel.text = "  Порыв ветра\n"
            wheatherController.gustWindBlock.valueLabel.text = "  \(roundedGustWind) м/с"
        } else {
            wheatherController.gustWindBlock.titleLabel.text = "  Порыв ветра\n"
            wheatherController.gustWindBlock.valueLabel.text = "  Н/Д" // Нет данных
        }
        
        let normTimeSunrise = convertData.convertUnixTimestampToReadableTime(unixTime: TimeInterval(weatherData.sys.sunrise))
        wheatherController.sunriseBlock.titleLabel.text = "  Время рассвета\n"
        wheatherController.sunriseBlock.valueLabel.text = "  \(normTimeSunrise)"
        
        let normTimeSunset = convertData.convertUnixTimestampToReadableTime(unixTime: TimeInterval(weatherData.sys.sunset))
        wheatherController.sunsetBlock.titleLabel.text = "  Время заката\n"
        wheatherController.sunsetBlock.valueLabel.text = "  \(normTimeSunset)"
        
        print("Данные для экрана добавлены/обновлены")
        
        // Обновляем фоновое изображение
        backgroundImage?.updateBackgroundImage(with: weatherData)
        print("Фоновое изображение добавлено/обновлено")
        
        
        // Собираем данные в блоки на экране
        wheatherController.cloudsBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.cloudsBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.cloudsBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Облачность"))
        
        wheatherController.pressureBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.pressureBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.pressureBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Давление"))
        wheatherController.humidityBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.humidityBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.humidityBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Влажность"))
        wheatherController.feelsTemperatureBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.feelsTemperatureBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.feelsTemperatureBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Температура"))
        wheatherController.speedWindBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.speedWindBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.speedWindBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Скорость ветра"))
        wheatherController.gustWindBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.gustWindBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.gustWindBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Порыв ветра"))
        wheatherController.sunriseBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.sunriseBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.sunriseBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Восход"))
        wheatherController.sunsetBlock.addArrangedSubview(blocks.createWeatherBlock(
            title: "\(wheatherController.sunsetBlock.titleLabel.text ?? "Нет данных")",
            value: "\(wheatherController.sunsetBlock.valueLabel.text ?? "Нет данных")",
            iconName: "Закат"))
        
    }
}
