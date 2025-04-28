import UIKit

// Задаём блок №4 (Ощущение температуры)
class FeelsTemperatureBlock: UIStackView {
        
    // Заголовок ощущения температуры
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение ощущения температуры
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для ощущения температуры
    private let iconImageView: UIImageView = {
        let feelsTemperatureImage = UIImageView()
        feelsTemperatureImage.image = UIImage(named: "Температура")
        feelsTemperatureImage.translatesAutoresizingMaskIntoConstraints = false
        return feelsTemperatureImage
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        axis = .vertical
        alignment = .leading
        distribution = .equalSpacing
        spacing = 2
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray.withAlphaComponent(0.35)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
     
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
        addArrangedSubview(iconImageView)
    }
}
