//
//  ConvertData.swift
//  petProjectWheather
//
//  Created by Геннадий on 24.02.2025.
//

import Foundation


// MARK: - Конвертация времени в нормальный формат
class ConvertData {
    
    func convertUnixTimestampToReadableTime(unixTime: TimeInterval) -> String {
        // Создаём объект Date из Unix timestamp
        let date = Date(timeIntervalSince1970: unixTime)
        
        // Настраиваем DateFormatter для отображения времени
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // Формат для часов и минут
        dateFormatter.timeZone = TimeZone.current // Устанавливаем текущую временную зону
        
        // Преобразуем дату в строку
        return dateFormatter.string(from: date)
    }
}
