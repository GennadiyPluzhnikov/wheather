import UIKit

//  Задаём блок №5 (Скорость ветра)
class SpeedWindBlock: UIStackView {
    
    // Заголовок скорости ветра
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение скорости ветра
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // Картинка для скорости ветра
    private let iconImageView: UIImageView = {
        let speedWindImage = UIImageView()
        speedWindImage.image = UIImage(named: "Скорость ветра")
        speedWindImage.translatesAutoresizingMaskIntoConstraints = false
        return speedWindImage
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
