// Логика построения таблицы с прогнозом

import UIKit

class TableView: UIViewController, UITableViewDataSource {
    
    var forecast: ForecastWeatherAPI.ForecastResponse?
    var forecastData: [ForecastWeatherAPI.ForecastDay] = []
    
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
        
        // Настройка расположения таблицы
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Настраиваем таблицу
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        // Получаем данные для текущей строки
        let forecastDay = forecastData[indexPath.row]
        
        // Настраиваем ячейку
        cell.configure(with: forecastDay)
        
        return cell
    }
    
    // MARK: - Получаем данные при открытии экрана прогноза
    
    func updateForecast(_ forecast: ForecastWeatherAPI.ForecastResponse) {
        self.forecast = forecast
        self.forecastData = forecast.forecast.forecastday
        tableView.reloadData()
    }
}
