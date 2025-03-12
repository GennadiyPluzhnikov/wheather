import UIKit

class ViewController: UIViewController {
    
    // Задаём поле ввода названия города
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write the city"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // Задаём кнопку для поиска погоды для города
    private let getWheatherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.85)
        button.layer.borderColor = UIColor.blue.withAlphaComponent(0.6).cgColor
        button.layer.borderWidth = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getWheatherTapped), for: .touchUpInside)
        return button
    }()
    
    // Задаём хинт
    private let textForExample: UILabel = {
        let text = UILabel()
        text.text = "For example, Moscow"
        text.font = UIFont.systemFont(ofSize: 13)
        text.textColor = .gray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    // Задаём заголовок для планеты
    let planetLabel: UILabel = {
        let label = UILabel()
        label.text = ""  // Начинаем с пустого текста
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Задаём изображение планеты
    let planetImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Планета")
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Проверка навигационного контроллера
        if let navController = self.navigationController {
            print("Навигационный контроллер есть! \(navController)")
        } else {
            print("Навигационного контроллера нет!")
        }
        
        // Добавляем элементы на экран
        view.addSubview(cityTextField)
        view.addSubview(getWheatherButton)
        view.addSubview(textForExample)
        view.addSubview(planetImageView)
        view.addSubview(planetLabel)
        constraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Вызываем анимацию, когда представление полностью появляется на экране
        let animation = Animation(view: self)
        animation.animatePlanetLabel()
    }
    
    // MARK: - Нажатие на кнопки поиска
    @objc private func getWheatherTapped() {
        print("Кнопку нажали")
        
        // Валидация поля города на пустоту
        guard let city = cityTextField.text, city.isEmpty == false else {
            let alert = SearchAlert()
            alert.showAlert(message: "Please enter the city")
            print("Валидация не пройдена")
            return
        }
        
        print("Валидация пройдена")
        
        // Получаем данные о погоде
        WheatherService().fetchWheather(for: city) { [weak self] response in
            DispatchQueue.main.async {
                if let response = response {
                    // После получения данных, переходим на второй экран
                    let nextVC = WheatherController()
                    nextVC.cityName = city // передаем город
                    nextVC.wheather = response // передаем данные о погоде
                    
                    // Сохраняем город для будущих входов
                    UserDefaults.standard.set(city, forKey: "selectedCity")
                    print("City saved: \(city)")
                    
                    // Переходим на экран погоды
                    self?.navigationController?.pushViewController(nextVC, animated: true)
                    print("Город найден, сохранен и на него перешли")
                    print("Передали данные: Город - \(city), Погода - \(String(describing: response))")
                } else {
                    let alert = SearchAlert()
                    alert.showAlert(message: "City not found")
                    print("Город не найден")
                }
            }
        }
    }
    
    // MARK: - Указываем расположение элементов на экране
    
    private func constraints() {
        NSLayoutConstraint.activate([
            // Поле ввода города
            cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Подсказка
            textForExample.leadingAnchor.constraint(equalTo: cityTextField.leadingAnchor),
            textForExample.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 10),
            
            // Кнопка
            getWheatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getWheatherButton.topAnchor.constraint(equalTo: textForExample.bottomAnchor, constant: 20),
            getWheatherButton.widthAnchor.constraint(equalToConstant: 100),
            getWheatherButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Заголовок для планеты
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.topAnchor.constraint(equalTo: getWheatherButton.bottomAnchor, constant: 70),
            
            // Изображение планеты
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.topAnchor.constraint(equalTo: getWheatherButton.bottomAnchor, constant: 100),
            planetImageView.widthAnchor.constraint(equalToConstant: 300),
            planetImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
