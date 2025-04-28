import UIKit

class ForecastButton: UIButton {
    var tapHandler: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupButton()
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        setTitle("Прогноз на 5 дней", for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .blue.withAlphaComponent(0.85)
        layer.borderColor = UIColor.blue.withAlphaComponent(0.6).cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func buttonTapped() {
        tapHandler?()
    }
}
