import Foundation

class WheatherService {
    let apiKey = "f8a7605a5bfe8751c81f8a6c8fb72b95"

    func fetchWheather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        
        // Задаем ссылку и проверяем её валидность
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        // Получение данных и декодировка ответа
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching weather: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil) // Указываем nil для появления системной ошибки
                return
            }

            // Логируем исходный JSON-ответ
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON for city \(city): \(jsonString)")
            }

            do {
                let wheatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(wheatherResponse) // Присваиваем значение параметра для отображения данных в интерфейсе
                print("Weather data for city \(city): \(wheatherResponse)") // Логируем данные о погоде
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil) // Указываем nil для появления системной ошибки
            }
        }.resume()
    }
}
