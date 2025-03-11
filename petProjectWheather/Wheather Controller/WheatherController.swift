// TEST!!!


import UIKit

class WheatherController: UIViewController {
    
    // MARK: - Properties
    var cityName: String!
    var wheather: WeatherResponse?
    
    
    // Задаём поле для названия города
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Задаём поле для температуры
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Задаём поле для описания погоды
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //  Задаём блок №1 (Облачность)
    let cloudsBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .fill
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок облачности
    let clouds: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение облачности
    let cloudsValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для облачности
    private let cloudsImage: UIImageView = {
        let cloudsImage = UIImageView()
        cloudsImage.image = UIImage(named: "Облачность")
        cloudsImage.translatesAutoresizingMaskIntoConstraints = false
        return cloudsImage
        
    }()
    
    // Блок №2 (Давление)
    let pressureBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .fill
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок давления
    let pressure: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение давления
    let pressureValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для давления
    private let pressureImage: UIImageView = {
        let pressureImage = UIImageView()
        pressureImage.image = UIImage(named: "Давление")
        pressureImage.translatesAutoresizingMaskIntoConstraints = false
        return pressureImage
    }()
    
    // Блок №3 (Влажность)
    let humidityBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .fill
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок влажности
    let humidity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение влажности
    let humidityValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для влажности
    private let humidityImage: UIImageView = {
        let humidityImage = UIImageView()
        humidityImage.image = UIImage(named: "Влажность")
        humidityImage.translatesAutoresizingMaskIntoConstraints = false
        return humidityImage
    }()
    
    //  Задаём блок №4 (Ощущение температуры)
    let feelsTemperatureBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .leading
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок ощущения температуры
    let feelsTemperature: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение ощущения температуры
    let feelsTemperatureValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для ощущения температуры
    private let feelsTemperatureImage: UIImageView = {
        let feelsTemperatureImage = UIImageView()
        feelsTemperatureImage.image = UIImage(named: "Температура")
        feelsTemperatureImage.translatesAutoresizingMaskIntoConstraints = false
        return feelsTemperatureImage
    }()
    
    //  Задаём блок №5 (Скорость ветра)
    let speedWindBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .leading
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок скорости ветра
    let speedWind: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение скорости ветра
    let speedWindValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // Картинка для скорости ветра
    private let speedWindImage: UIImageView = {
        let speedWindImage = UIImageView()
        speedWindImage.image = UIImage(named: "Скорость ветра")
        speedWindImage.translatesAutoresizingMaskIntoConstraints = false
        return speedWindImage
    }()
    
    //  Задаём блок №6 (Порыв ветра)
    let gustWindBlock: UIStackView = {
        let parameters = UIStackView()
        parameters.axis = .vertical
        parameters.alignment = .leading
        parameters.distribution = .equalSpacing
        parameters.spacing = 2
        parameters.translatesAutoresizingMaskIntoConstraints = false
        parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
        parameters.layer.cornerRadius = 10
        parameters.layer.borderWidth = 1
        parameters.layer.borderColor = UIColor.gray.cgColor
        return parameters
    }()
    
    // Заголовок порыва ветра
    let gustWind: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение порыва ветра
    let gustWindValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для порыва ветра
    private let gustWindImage: UIImageView = {
        let gustWindImage = UIImageView()
        gustWindImage.image = UIImage(named: "Порыв ветра")
        gustWindImage.translatesAutoresizingMaskIntoConstraints = false
        return gustWindImage
    }()
        
        // Задаём блок №7 (Восход)
        let sunriseBlock: UIStackView = {
            let parameters = UIStackView()
            parameters.axis = .vertical
            parameters.alignment = .leading
            parameters.distribution = .equalSpacing
            parameters.spacing = 2
            parameters.translatesAutoresizingMaskIntoConstraints = false
            parameters.backgroundColor = .lightGray.withAlphaComponent(0.4)
            parameters.layer.cornerRadius = 10
            parameters.layer.borderWidth = 1
            parameters.layer.borderColor = UIColor.gray.cgColor
            return parameters
        }()
        
        // Заголовок время восхода
        let timeSunrise: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Значение время восхода
        let timeSunriseValue: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Картинка для восхода
        private let sunriseImage: UIImageView = {
            let sunriseImage = UIImageView()
            sunriseImage.image = UIImage(named: "Восход")
            sunriseImage.translatesAutoresizingMaskIntoConstraints = false
            return sunriseImage
        }()
        
        // Задаём блок №8 (Закат)
        let sunsetBlock: UIStackView = {
            let parameters = UIStackView()
            parameters.axis = .vertical
            parameters.alignment = .leading
            parameters.distribution = .equalSpacing
            parameters.spacing = 2
            parameters.translatesAutoresizingMaskIntoConstraints = false
            parameters.backgroundColor = .lightGray.withAlphaComponent(0.35)
            parameters.layer.cornerRadius = 10
            parameters.layer.borderWidth = 1
            parameters.layer.borderColor = UIColor.gray.cgColor
            return parameters
        }()
        
        // Заголовок время заката
        let timeSunset: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Значение время заката
        let timeSunsetValue: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Картинка для заката
        private let sunsetImage: UIImageView = {
            let sunsetImage = UIImageView()
            sunsetImage.image = UIImage(named: "Закат")
            sunsetImage.translatesAutoresizingMaskIntoConstraints = false
            return sunsetImage
        }()
        
        // Кнопка перехода на экран прогноза погоды
        private let forecastWheather: UIButton = {
            let button = UIButton()
            button.setTitle("Прогноз на 5 дней", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .blue.withAlphaComponent(0.85)
            button.layer.borderColor = UIColor.blue.withAlphaComponent(0.6).cgColor
            button.layer.borderWidth = 3
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(getForecastWheather), for: .touchUpInside)
            return button
        }()
        
        // Кнопка смены города
        private let changeCity: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "location.fill"), for: .normal)
            button.tintColor = .blue.withAlphaComponent(0.85)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(changeCityChoice), for: .touchUpInside)
            return button
        }()
        
        // Создаём UIScrollView для обновления данных о погоде
        private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        // Создаём UIRefreshControl
        private let refreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refreshWeatherData), for: .valueChanged)
            return refreshControl
        }()
        
        // Добавляем картинку на задний фон
        let backgroundImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            guard let city = cityName else {
                print("Город не был передан!")
                return
            }
            
            // Добавляем отображение фоновой картинки
            view.addSubview(backgroundImageView)
            
            // Добавляем UIScrollView
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            // Привязываем опцию обновление погоды
            scrollView.refreshControl = refreshControl
            
            // Добавляем основные главные на экран
            contentView.addSubview(cityLabel)
            contentView.addSubview(temperatureLabel)
            contentView.addSubview(descriptionLabel)
            
            
            // Добавляем блоки на экран
            contentView.addSubview(mainBlocksStackView)
            
            // Теперь инициализируем rowStackView
            let blocks = Blocks()
            
            blocks.row1StackView = blocks.createRowStackView()
            blocks.row2StackView = blocks.createRowStackView()
            blocks.row3StackView = blocks.createRowStackView()
            blocks.row4StackView = blocks.createRowStackView()
            
            blocks.row1StackView.addArrangedSubview(blocks.setBlockSize(cloudsBlock))
            blocks.row1StackView.addArrangedSubview(blocks.setBlockSize(pressureBlock))
            
            blocks.row2StackView.addArrangedSubview(blocks.setBlockSize(humidityBlock))
            blocks.row2StackView.addArrangedSubview(blocks.setBlockSize(feelsTemperatureBlock))
            
            blocks.row3StackView.addArrangedSubview(blocks.setBlockSize(speedWindBlock))
            blocks.row3StackView.addArrangedSubview(blocks.setBlockSize(gustWindBlock))
            
            blocks.row4StackView.addArrangedSubview(blocks.setBlockSize(sunriseBlock))
            blocks.row4StackView.addArrangedSubview(blocks.setBlockSize(sunsetBlock))
            
            // Добавляем горизонтальные стеки в главный вертикальный стек
            mainBlocksStackView.addArrangedSubview(blocks.row1StackView)
            mainBlocksStackView.addArrangedSubview(blocks.row2StackView)
            mainBlocksStackView.addArrangedSubview(blocks.row3StackView)
            mainBlocksStackView.addArrangedSubview(blocks.row4StackView)
            
            // Загружаем данные о погоде
            loadWeather(for: "\(city)")
            
            // Добавляем кнопку перехода к экрану прогноза погоды
            self.view.addSubview(forecastWheather)
            
            // Добавляем кнопку смены города
            contentView.addSubview(changeCity)
            
            // Добавляем расположение
            constraints()
        }
        // MARK: - Загрузка данных в интерфейсе
        
        func loadWeather(for city: String) {
            let importData = ImportData()
            let update = UpdateUI(wheatherController: self) // Передаем текущий экземпляр WheatherController
            
            importData.fetchWeather(for: city) { [weak self] weatherData in
                if let weatherData = weatherData {
                    update.updateUI(with: weatherData)
                    print("Данные загружены на экран")
                } else {
                    print("Failed to fetch weather data for city: \(city)")
                }
            }
        }
    // MARK: - Обновление данных
    @objc private func refreshWeatherData() {
        let update = UpdateUI(wheatherController: self) // Передаем текущий экземпляр WheatherController
        // Получаем данные для города внутри метода
        guard let city = cityName else { return }
        
        WheatherService().fetchWheather(for: city) { [weak self] weatherData in
            DispatchQueue.main.async {
                if let weatherData = weatherData {
                    update.updateUI(with: weatherData) // Обновляем UI с полученными данными
                } else {
                    print("Failed to refresh weather data")
                }
                self?.refreshControl.endRefreshing() // Завершаем обновление
            }
        }
    }
    
    // MARK: - Переход на экран с прогнозом погоды
    @objc private func getForecastWheather() {
        let city = cityName
        let days = 5
        let alert = Alert()
        let forecast = WheatherForecastService()
        // Получаем данные о погоде для города
        forecast.fetchWeatherForecast(for: city!, days: days) { [weak self] response in
            DispatchQueue.main.async {
                if let response = response {
                    // После получения данных, переходим на второй экран
                    
                    let nextVC = WheatherControllerForecast()
                    nextVC.forecastData = response // передаем данные о погоде
                    self?.navigationController?.pushViewController(nextVC, animated: true)
                    print("Передали данные: Город - \(city), Погода - \(String(describing: response))")
                } else {
                    alert.showAlert(message: "Wheather forecast not found")
                }
            }
        }
    }
    
    // MARK: - Задаём главный вертикальный стэк
    
    let mainBlocksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Функция для кнопки смены города
    @objc private func changeCityChoice() {
        let nextVC = ViewController()
        UserDefaults.standard.removeObject(forKey: "selectedCity")
        print("City removed")
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - Указываем расположение элементов на экране
    
    // Создаём contentView внутри ScrollView
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            
            // Background Image
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Ограничения для ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Ограничения для contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Основной стек
            mainBlocksStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            mainBlocksStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainBlocksStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainBlocksStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            // Элементы внутри ScrollView
            cityLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            cityLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            temperatureLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            forecastWheather.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 630),
            forecastWheather.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            forecastWheather.widthAnchor.constraint(equalToConstant: 250),
            forecastWheather.heightAnchor.constraint(equalToConstant: 40),
            
            changeCity.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            changeCity.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 5),
            changeCity.widthAnchor.constraint(equalToConstant: 30),
            changeCity.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
