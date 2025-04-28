import Foundation
import UIKit

// MARK: - Устанавливаем расположение и адаптацию под различные экраны

class Blocks {
    
    // Функция для создания горизонтального стека
    func createRowStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    // Функция для указания размера блока
    func setBlockSize(_ block: UIStackView) -> UIStackView {
        block.widthAnchor.constraint(equalToConstant: 150).isActive = true // Фиксируем ширину
        block.heightAnchor.constraint(equalToConstant: 100).isActive = true // Фиксируем высоту
        return block
    }

    // Создаём 4 горизонтальных стека
    var row1StackView: UIStackView!
    var row2StackView: UIStackView!
    var row3StackView: UIStackView!
    var row4StackView: UIStackView!
    
    func createWeatherBlock(title: String, value: String, iconName: String) -> UIStackView {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0 // Разрешаем многострочный текст
        label.lineBreakMode = .byWordWrapping // Перенос по словам
        label.setContentHuggingPriority(.defaultLow, for: .horizontal) // Позволяем растягиваться
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal) // Сжимать в последнюю очередь
        
        let param = UILabel()
        param.text = value
        param.font = UIFont.systemFont(ofSize: 23)
        param.textColor = .black
        param.textAlignment = .left
        param.numberOfLines = 0
        param.setContentHuggingPriority(.defaultLow, for: .horizontal) // Позволяем растягиваться
        param.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal) // Сжимать в последнюю очередь


        let imageView = UIImageView()
        imageView.image = UIImage(named: iconName)
        imageView.contentMode = .scaleAspectFit // Сохраняем пропорции
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true // Ограничиваем ширину
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true // Ограничиваем высоту
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Позволяем растягиваться
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal) // Позволяет сжиматься первым
        

        let stackView = UIStackView(arrangedSubviews: [label, param, imageView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
}
