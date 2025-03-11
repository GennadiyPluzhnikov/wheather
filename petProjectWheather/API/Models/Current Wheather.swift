

import Foundation

struct WeatherResponse: Codable {
    let coord: Coord // Координаты города
    let weather: [Weather] // Описание погоды
    let main: Main // Основные параметры погоды
    let wind: Wind // Про ветер
    let clouds: Clouds // Про облачность
    let dt: Int // Время расчёта данных
    let sys: Sys // Внутренние параметры + время восхода/захода солнца
    let name: String // Название города
}

struct Coord: Codable {
    let lon: Double // Долгота
    let lat: Double // Широта
}

struct Weather: Codable {
    let main: String
    let description: String // Погодные условия в группе.
}

struct Main: Codable {
    let temp: Double // Температура. Единица по умолчанию: Кельвин, метрика: Цельсия, имперская: Фаренгейт
    let feels_like: Double // Температура. Этот параметр температуры учитывает восприятие человеком погоды. Единица по умолчанию: Кельвин, метрика: Цельсия, имперская: Фаренгейт
    let pressure: Int // Атмосферное давление на уровне моря, гПа
    let humidity: Int // Влажность, %
}

struct Wind: Codable {
    let speed: Double // Скорость ветра. Единица измерения по умолчанию: метр/сек, метрик: метр/сек, императорский: мили/час
    let gust: Double? // Порыв ветра. Единица измерения по умолчанию: метр/сек, метрик: метр/сек, императорский: мили/час
}

struct Clouds: Codable {
    let all: Int // Облачность, %
}

struct Sys: Codable {
    let sunrise: Int // Время восхода солнца, unix, UTC
    let sunset: Int // Время заката, unix, UTC
}


