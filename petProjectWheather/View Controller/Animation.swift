// Анимация для стартового экрана ввода города

import Foundation
import UIKit

class Animation {
    
    var view: ViewController?
    
    init(view: ViewController? = nil) {
        self.view = view
    }
    
    // Анимация текстового заголовка
    func animatePlanetLabel() {
        
        let text = "Find out the weather anywhere!"
        var charIndex = 0.0
        
        // Запускаем печатание текста
        for letter in text {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                DispatchQueue.main.async {
                    self.view?.planetLabel.text?.append(letter)
                }
            }
            charIndex += 1
        }
        
        // После завершения печатания текста запускаем анимацию появления планеты
        let totalTypingDuration = 0.1 * charIndex
        DispatchQueue.main.asyncAfter(deadline: .now() + totalTypingDuration) {
            self.fadeInPlanet()
        }
    }
    
    // Анимация появления картинки
    func fadeInPlanet() {
        
        let fadeInImage = CABasicAnimation(keyPath: "opacity")
        fadeInImage.fromValue = 0  // Начальная прозрачность (невидимая)
        fadeInImage.toValue = 1    // Конечная прозрачность (полностью видимая)
        fadeInImage.duration = 10.0  // Длительность анимации
        fadeInImage.timingFunction = CAMediaTimingFunction(name: .easeIn)  // Плавное начало
        fadeInImage.fillMode = .forwards  // Сохраняем конечное состояние (видимость)
        fadeInImage.isRemovedOnCompletion = false  // Не удаляем анимацию после её завершения
        
        view?.planetImageView.layer.add(fadeInImage, forKey: "fadeIn")
    }
}
