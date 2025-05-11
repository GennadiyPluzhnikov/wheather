// Скролл для обновления погоды

import UIKit

class ScrollRefreshHandler {
    weak var viewController: UIViewController?
    var cityName: String?
    
    let scrollView: UIScrollView
    let contentView: UIView
    let refreshControl: UIRefreshControl
    
    init(viewController: UIViewController, cityName: String?) {
        self.viewController = viewController
        self.cityName = cityName
        
        // Инициализируем UI-компоненты
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    func setupScrollView(in parentView: UIView) {
        parentView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.refreshControl = refreshControl
    }
    
    @objc private func handleRefresh() {
        guard let city = cityName else { return }
        
        WheatherService().fetchWheather(for: city) { [weak self] weatherData in
            DispatchQueue.main.async {
                if let weatherData = weatherData,
                   let viewController = self?.viewController as? WheatherController {
                    UpdateUI(wheatherController: viewController).updateUI(with: weatherData)
                } else {
                    print("Failed to refresh weather data")
                }
                self?.refreshControl.endRefreshing()
            }
        }
    }
}
