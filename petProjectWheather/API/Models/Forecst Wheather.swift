import Foundation

enum ForecastWeatherAPI {

    // Основная структура для ответа API
    struct ForecastResponse: Codable {
        let location: Location
        let forecast: Forecast
    }

    // Структура для данных о местоположении
    struct Location: Codable {
        let name: String
        let country: String
        let lat: Double
        let lon: Double

        // Используем CodingKeys для соответствия JSON-ключам
        enum CodingKeys: String, CodingKey {
            case name
            case country
            case lat
            case lon
        }
    }

    // Структура для прогноза погоды
    struct Forecast: Codable {
        let forecastday: [ForecastDay]
    }

    // Структура для данных за один день
    struct ForecastDay: Codable {
        let date: String
        let day: Day

        enum CodingKeys: String, CodingKey {
            case date
            case day
        }
    }

    // Структура для данных за день
    struct Day: Codable {
        let maxtempC: Double
        let mintempC: Double
        let condition: Condition

        enum CodingKeys: String, CodingKey {
            case maxtempC = "maxtemp_c"
            case mintempC = "mintemp_c"
            case condition
        }
    }

    // Структура для описания погодных условий
    struct Condition: Codable {
        let text: String
        let icon: String
    }
}

