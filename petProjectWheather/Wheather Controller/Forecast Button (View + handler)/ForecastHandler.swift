import UIKit

class ForecastHandler {
    weak var viewController: UIViewController?
    var cityName: String?
    let forecastService: WheatherForecastService
    let alert: Alert
    
    init(viewController: UIViewController,
         cityName: String?,
         forecastService: WheatherForecastService = WheatherForecastService(),
         alert: Alert = Alert()) {
        self.viewController = viewController
        self.cityName = cityName
        self.forecastService = forecastService
        self.alert = alert
    }
    
    func handleForecastButtonTap() {
        guard let city = cityName else { return }
        
        forecastService.fetchWeatherForecast(for: city, days: 5) { [weak self] (response: ForecastWeatherAPI.ForecastResponse?) in
            DispatchQueue.main.async {
                if let forecastData = response {
                    self?.showForecast(with: forecastData)
                } else {
                    self?.alert.showAlert(message: "Weather forecast not found")
                }
            }
        }
    }
    
    private func showForecast(with data: ForecastWeatherAPI.ForecastResponse) {
        let forecastVC = WheatherControllerForecast()
        forecastVC.forecastData = data
        viewController?.navigationController?.pushViewController(forecastVC, animated: true)
        print("Forecast data shown for city: \(data.location.name)")
    }
}
