import UIKit

class CityChangeHandler {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func createChangeCityButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.tintColor = .blue.withAlphaComponent(0.85)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCityChange), for: .touchUpInside)
        return button
    }
    
    @objc private func handleCityChange() {
        let nextVC = ViewController()
        UserDefaults.standard.removeObject(forKey: "selectedCity")
        print("City removed")
        viewController?.navigationController?.pushViewController(nextVC, animated: true)
    }
}

