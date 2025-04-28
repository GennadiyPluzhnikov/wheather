import UIKit
import SnapKit


class WheatherControllerForecast: UIViewController {
    
    // Данные прогноза погоды
    var forecastData: ForecastWeatherAPI.ForecastResponse? = nil
    
    // Задаём поле для заголовка
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Прогноз на 5 дней"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Задаём кнопку
    private let happyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Ура!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .blue.withAlphaComponent(0.85)
        button.layer.borderColor = UIColor.blue.withAlphaComponent(0.6).cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(happyAnimation), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Добавляем заголовок на экран
        view.addSubview(titleLabel)
        print("Заголовок добавлен на экран")
        
        // Настраиваем расположение заголовка
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(20)
        }
        print("Ограничения для заголовка установлены")
        
        // Создаём и настраиваем TableViewController
        let tableView = TableView()
        if let forecastData = forecastData {
            tableView.updateForecastData(forecastData) // Обновляем данные
        }
        
        // Добавляем TableViewController как дочерний
        addChild(tableView)
        view.addSubview(tableView.view)
        tableView.didMove(toParent: self)
        print("Таблица добавлена на экран")
        
        // Настраиваем ограничения для таблицы
        tableView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-20)
        }
        print("Ограничения для таблицы установлены")
        
        // Добавляем кнопку
        view.addSubview(happyButton)
        print("Кнопка добавлена на экран")
        
        // Настраиваем ограничения для кнопки
        happyButton.snp.makeConstraints {make in
            make.bottom.equalToSuperview().offset(-85)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
    @objc func happyAnimation() {
        // Создаем AnimationView с нулевым frame
        let confettiView = AnimationView(frame: .zero)
        confettiView.backgroundColor = .clear
        view.addSubview(confettiView)
        view.bringSubviewToFront(confettiView)

        // Устанавливаем ограничения для confettiView, чтобы он занимал весь экран
        confettiView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Растягиваем на весь экран
        }

        // Убедимся, что представление правильно размещено перед началом анимации
        confettiView.setNeedsLayout()
        confettiView.layoutIfNeeded()

        // Запускаем анимацию
        confettiView.startFireworkAnimation()

        // Удаляем анимацию через 7 секунд
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            confettiView.removeFromSuperview()
        }
    }
}




