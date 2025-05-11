// Файл с логикой поиска введенного города с погодой
/*
import Foundation
import UIKit


class SearchCity {
    var viewController: ViewController?

    init(viewController: ViewController) {
        self.viewController = viewController
    }

    func searchCity() {
        guard let city = viewController?.cityTextField.text, !city.isEmpty else {
            let alert = SearchAlert()
            alert.showAlert(message: "Please enter the city")
            print("Валидация не пройдена")
            return
        }
        
        print("Стартует поиск города")
        WheatherService().fetchWheather(for: city) { [weak self] response in
            DispatchQueue.main.async {
                if let response = response {
                    // После получения данных, переходим на второй экран
                    let nextVC = WheatherController()
                    nextVC.cityName = city // передаем город
                    nextVC.wheather = response // передаем данные о погоде

                    // Получаем window и root navigation controller
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first,
                       let navigationController = window.rootViewController as? UINavigationController {
                        
                        // Сохраняем город для будущих входов
                        UserDefaults.standard.set(city, forKey: "selectedCity")
                        print("City saved: \(city)")
                        
                        // Переходим на экран погоды
                        navigationController.pushViewController(nextVC, animated: true)
                        print("Город найден, сохранен и на него перешли")
                        print("Передали данные: Город - \(city), Погода - \(String(describing: response))")
                    } else {
                        print("Ошибка: Не удалось получить навигационный контроллер")
                    }
                    print("Передали данные: Город - \(city), Погода - \(String(describing: response))")

                    // Сохраняем город для будущих входов
                    UserDefaults.standard.set(city, forKey: "selectedCity")
                    print("City saved: \(city)")
                    print("Город найден, сохранен и на него перешли")
                } else {
                    let alert = SearchAlert()
                    alert.showAlert(message: "City not found")
                    print("Город не найден")
                }
            }
        }
    }
}

*/

