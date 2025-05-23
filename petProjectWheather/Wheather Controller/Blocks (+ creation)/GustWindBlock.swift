// Блок с порывом ветра

import UIKit


class GustWindBlock:UIStackView {
    
    // Заголовок порыва ветра
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Значение порыва ветра
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Картинка для порыва ветра
    private let iconImageView: UIImageView = {
        let gustWindImage = UIImageView()
        gustWindImage.image = UIImage(named: "Порыв ветра")
        gustWindImage.translatesAutoresizingMaskIntoConstraints = false
        return gustWindImage
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
