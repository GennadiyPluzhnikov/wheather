// Экран прогноза погоды (на 3 дня)

import UIKit
import SnapKit

class WheatherControllerForecast: UIViewController {
    
    var forecast: ForecastWeatherAPI.ForecastResponse?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Прогноз на 3 дня"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let happyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("На шашлыки!", for: .normal)
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
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        // Добавляем заголовок
        view.addSubview(titleLabel)
        
        let tableView = TableView()
        
        if let forecast = forecast {
            tableView.updateForecast(forecast)
        }
        
        // Добавляем таблицу
        addChild(tableView)
        view.addSubview(tableView.view)
        tableView.didMove(toParent: self)
        
        // Добавляем кнопку
        view.addSubview(happyButton)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(20)
        }
        
        guard let tableView = children.first as? TableView else { return } // Задание tableView и проверка наличия таблицы
        tableView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        happyButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-85)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
    
    // Нажатие на кнопки с анимацией
    @objc private func happyAnimation() {
        let confettiView = AnimationView(frame: .zero)
        confettiView.backgroundColor = .clear
        view.addSubview(confettiView)
        view.bringSubviewToFront(confettiView)

        confettiView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        confettiView.setNeedsLayout()
        confettiView.layoutIfNeeded()
        confettiView.startFireworkAnimation()

        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            confettiView.removeFromSuperview()
        }
    }
}
