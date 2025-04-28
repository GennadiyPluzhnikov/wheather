import Foundation
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let minTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .gray
        return label
    }()
    
    let maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .systemBlue
        progressView.trackTintColor = .systemGray5
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupUI()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupUI() {
           // Добавляем элементы на ячейку
           contentView.addSubview(dateLabel)
           contentView.addSubview(weatherIcon)
           contentView.addSubview(minTempLabel)
           contentView.addSubview(progressBar)
           contentView.addSubview(maxTempLabel)
           
           // Настройка constraints с использованием SnapKit
           dateLabel.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(10)
               make.centerY.equalToSuperview()

           }
           
           weatherIcon.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(100)
               make.centerY.equalToSuperview()
               make.width.height.equalTo(35)
           }
           
           minTempLabel.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(150)
               make.centerY.equalToSuperview()
           }
           
           progressBar.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(200)
               make.centerY.equalToSuperview()
               make.width.equalTo(100)
               make.height.equalTo(5)
           }
           
           maxTempLabel.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(310)
               make.centerY.equalToSuperview()
           }
       }
       
       // Метод для настройки ячейки данными
       func configure(with forecastDay: ForecastWeatherAPI.ForecastDay) {
           let formattedDate = ConvertDate().formatDate(forecastDay.date)
           dateLabel.text = formattedDate
           
           let forecastMinTempRounded = Int(forecastDay.day.mintempC)
           minTempLabel.text = "\(forecastMinTempRounded)°C"
           
           let forecastMaxTempRounded = Int(forecastDay.day.maxtempC)
           maxTempLabel.text = "\(forecastMaxTempRounded)°C"
           
           // Рассчитываем дельту между максимальной и минимальной температурой
           let minTemp = forecastMinTempRounded
           let maxTemp = forecastMaxTempRounded
           let deltaTemp = maxTemp - minTemp
           let maxPossibleTempDifference = 10.0 // Допустим, максимальная разница температур 10°C
           
           // Нормализуем прогресс
           let progress = min(CGFloat(deltaTemp) / CGFloat(maxPossibleTempDifference), 1.0)
           progressBar.setProgress(Float(progress), animated: true)
           
           // Загрузка иконки из сети
           if let iconURL = URL(string: "https:\(forecastDay.day.condition.icon)") {
               DispatchQueue.global().async {
                   if let data = try? Data(contentsOf: iconURL) {
                       DispatchQueue.main.async {
                           self.weatherIcon.image = UIImage(data: data)
                       }
                   }
               }
           }
       }
   }
