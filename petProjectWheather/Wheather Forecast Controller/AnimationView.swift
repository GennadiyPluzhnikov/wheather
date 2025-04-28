import UIKit

class AnimationView: UIView {
    
    private var emitterLayer: CAEmitterLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFireworkEmitter()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFireworkEmitter()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Обновляем позицию эмиттера при изменении размеров
        emitterLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func setupFireworkEmitter() {
        // Создаем эмиттер
        emitterLayer = CAEmitterLayer()
        
        // Устанавливаем frame для эмиттера
        emitterLayer.frame = self.bounds
        emitterLayer.position = CGPoint(x: bounds.midX, y: bounds.midY) // Позиция эмиттера в центре экрана
        
        // Устанавливаем размеры эмиттера
        emitterLayer.emitterSize = CGSize(width: 10, height: 10)
        emitterLayer.emitterShape = .point // Эмиттер в виде точки, из которой генерируются частицы
        emitterLayer.renderMode = .additive // Частицы не перекрывают друг друга, а добавляются
        
        layer.addSublayer(emitterLayer)
        
        // Создаем настройки для частиц
        let fireworkCell = CAEmitterCell()
        fireworkCell.contents = UIImage(named: "confetti_image9")?.cgImage
        fireworkCell.birthRate = 50
        fireworkCell.lifetime = 4.0
        fireworkCell.lifetimeRange = 1.5
        fireworkCell.velocity = 300
        fireworkCell.velocityRange = 200
        fireworkCell.emissionLongitude = 2 * .pi
        fireworkCell.emissionRange = .pi
        fireworkCell.scale = 0.4
        fireworkCell.scaleRange = 0.6
        fireworkCell.alphaRange = 1
        fireworkCell.alphaSpeed = -0.5
        fireworkCell.color = UIColor.white.cgColor
        fireworkCell.spin = 1.5
        fireworkCell.spinRange = 2
        
        // Присваиваем частицы в эмиттер
        emitterLayer.emitterCells = [fireworkCell]
    }
    
    func startFireworkAnimation() {
        // Анимация хаотичного движения частиц
        let explosionAnimation = CAKeyframeAnimation(keyPath: "emitterCells.fireworkCell.birthRate")
        explosionAnimation.values = [0, 200, 0]
        explosionAnimation.keyTimes = [0, 0.3, 1]
        explosionAnimation.duration = 1.5 // Анимация взрыва частиц

        // Анимация исчезновения частиц (уменьшаем альфу)
        let fadeAnimation = CAKeyframeAnimation(keyPath: "emitterCells.fireworkCell.alpha")
        fadeAnimation.values = [1, 0]
        fadeAnimation.keyTimes = [0.7, 1]
        fadeAnimation.duration = 1.5 // Частицы исчезают после взрыва
        
        // Запуск анимации взрыва и исчезновения
        emitterLayer.add(explosionAnimation, forKey: "explosion")
        emitterLayer.add(fadeAnimation, forKey: "fade")
        
        // Запуск эмиттера частиц
        for cell in emitterLayer.emitterCells! {
            cell.birthRate = 20 // Количество частиц для плавного эффекта
        }
    }
}
