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
