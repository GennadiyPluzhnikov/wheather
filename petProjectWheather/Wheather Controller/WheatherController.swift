// Экран текущей погоды

import UIKit

class WheatherController: UIViewController {
    
    // MARK: - Properties
    var cityName: String!
    var wheather: WeatherResponse?
    
    
    // Задаем главные параметры в интерфейсе
    let mainLabels = MainLabels()
    
    // Задаём блоки в интерфейсе
    let cloudsBlock = CloudsBlock() // Облачность
    let pressureBlock = PressureBlock() // Давление
    let humidityBlock = HumidityBlock() // Влажность
    let feelsTemperatureBlock = FeelsTemperatureBlock() // Ощущение теспературы
    let speedWindBlock = SpeedWindBlock() // Скорость ветра
    let gustWindBlock = GustWindBlock() // Порыв ветра
    let sunriseBlock = SunriseBlock() // Восход
    let sunsetBlock = SunsetBlock() // Закат
    
    // Кнопка прогноза погоды и её обработка
    private let forecastButton = ForecastButton()
    private var forecastHandler: ForecastHandler?
    
    // Кнопка смены города и её обработка
    private var changeCity: UIButton!
    private var cityChangeHandler: CityChangeHandler!
    
    private var scrollRefreshHandler: ScrollRefreshHandler! // Обновление данных через скролл
    
    // Задаём главный вертикальный стэк
    let mainBlocksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        
        // Инициализируем обработчик скролла
        scrollRefreshHandler = ScrollRefreshHandler(viewController: self, cityName: cityName)
        scrollRefreshHandler.setupScrollView(in: view)
        
        // Получаем ссылки для использования в constraints
        let scrollView = scrollRefreshHandler.scrollView
        let contentView = scrollRefreshHandler.contentView
        
        // Добавляем основные параметры на экран
        contentView.addSubview(mainLabels.cityLabel)
        contentView.addSubview(mainLabels.temperatureLabel)
        contentView.addSubview(mainLabels.descriptionLabel)
        
        
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
        forecastHandler = ForecastHandler(viewController: self, cityName: cityName)
        forecastButton.tapHandler = { [weak self] in
            self?.forecastHandler?.handleForecastButtonTap()
        }
        view.addSubview(forecastButton)
        
        // Добавляем кнопку смены города
        cityChangeHandler = CityChangeHandler(viewController: self)
        changeCity = cityChangeHandler.createChangeCityButton()
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
    
    // MARK: - Указываем расположение элементов на экране
    
    
    func constraints() {
        
        guard let scrollView = scrollRefreshHandler?.scrollView,
              let contentView = scrollRefreshHandler?.contentView else { return }
        
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
            
            // Элементы внутри ScrollView
            mainLabels.cityLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            mainLabels.cityLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            mainLabels.temperatureLabel.topAnchor.constraint(equalTo: mainLabels.cityLabel.bottomAnchor, constant: 10),
            mainLabels.temperatureLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            mainLabels.descriptionLabel.topAnchor.constraint(equalTo: mainLabels.temperatureLabel.bottomAnchor, constant: 10),
            mainLabels.descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            forecastButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 630),
            forecastButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            forecastButton.widthAnchor.constraint(equalToConstant: 250),
            forecastButton.heightAnchor.constraint(equalToConstant: 40),
            
            changeCity.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            changeCity.leadingAnchor.constraint(equalTo: mainLabels.cityLabel.trailingAnchor, constant: 5),
            changeCity.widthAnchor.constraint(equalToConstant: 30),
            changeCity.heightAnchor.constraint(equalToConstant: 30),
            
            // Основной стек
            mainBlocksStackView.topAnchor.constraint(equalTo: mainLabels.descriptionLabel.bottomAnchor, constant: 20),
            mainBlocksStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainBlocksStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainBlocksStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
        ])
    }
}
