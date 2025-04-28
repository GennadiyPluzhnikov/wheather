import UIKit

// Блок №1 (Влажность)
class CloudsBlock: UIStackView {
    
    // Заголовок облачности
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение облачности
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка облачности
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Облачность")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
