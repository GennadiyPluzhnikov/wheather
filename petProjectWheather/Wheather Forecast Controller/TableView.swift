import UIKit

class TableView: UIViewController, UITableViewDataSource {
    
    var forecast: ForecastWeatherAPI.ForecastResponse? = nil // Данные о прогнозе погоды
    var forecastData: [ForecastWeatherAPI.ForecastDay] = [] // Массив данных для таблицы
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.dataSource = self
        
        // Регистрируем кастомную ячейку
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        // Добавляем таблицу на экран
        view.addSubview(tableView)
        
        // Настройка layout с использованием SnapKit
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // Если данные уже переданы, обновляем таблицу
        if let forecast = forecast {
            updateForecastData(forecast)
            print("Данные получены и обновлены. Количество дней - \(forecastData.count)")
        } else {
            print("Данные не переданы")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData.count //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        // Получаем данные для текущей строки
        let forecastDay = forecastData[indexPath.row]
        
        // Настраиваем ячейку
        cell.configure(with: forecastDay)
        
        return cell
    }
    
    // MARK: - Обновляем данные при открытии прогноза
    
    func updateForecastData(_ forecast: ForecastWeatherAPI.ForecastResponse) {
        self.forecast = forecast
        self.forecastData = forecast.forecast.forecastday
        tableView.reloadData()
    }
}
