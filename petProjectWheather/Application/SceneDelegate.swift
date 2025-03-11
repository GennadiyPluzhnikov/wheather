import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        // Создаем ViewController для ввода города
        let viewController = ViewController()
        
        // Встраиваем ViewController в UINavigationController
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // Устанавливаем navigationController как корневой контроллер
        window.rootViewController = navigationController
        
        // Делаем окно видимым
        window.makeKeyAndVisible()
        
        // Проверяем, есть ли сохранённый город
        if let savedCity = UserDefaults.standard.string(forKey: "selectedCity") {
            print("Loaded city from UserDefaults: \(savedCity)")
            // Если есть сохранённый город, переходим на экран погоды
            let weatherController = WheatherController()
            weatherController.cityName = savedCity
            navigationController.pushViewController(weatherController, animated: false)
        } else {
            print("No city found in UserDefaults")
        }
        
        // Отладочное сообщение
        print("NavigationController is set as root: \(navigationController)")
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
