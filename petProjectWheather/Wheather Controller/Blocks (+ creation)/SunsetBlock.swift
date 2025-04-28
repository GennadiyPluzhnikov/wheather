import UIKit

// Задаём блок №8 (Закат)
class SunsetBlock: UIStackView {
    
    // Заголовок время заката
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение время заката
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для заката
    private let iconImageView: UIImageView = {
        let sunsetImage = UIImageView()
        sunsetImage.image = UIImage(named: "Закат")
        sunsetImage.translatesAutoresizingMaskIntoConstraints = false
        return sunsetImage
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
