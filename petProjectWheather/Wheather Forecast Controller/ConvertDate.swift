// Конвертация даты в более читаемый формат

import Foundation

class ConvertDate {
    
    func formatDate(_ dateString: String) -> String {
        
        // Создаем DateFormatter для парсинга входной строки
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        // Преобразуем строку в Date
        guard let date = inputFormatter.date(from: dateString) else {
            return dateString // Если не удалось распарсить, возвращаем исходную строку
        }
        
        // Создаем Calendar для проверки даты
        let calendar = Calendar.current
        let today = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // Проверяем, является ли дата сегодняшним днем
        if calendar.isDate(date, inSameDayAs: today) {
            return "Сегодня"
        }
        
        // Проверяем, является ли дата завтрашним днем
        if calendar.isDate(date, inSameDayAs: tomorrow) {
            return "Завтра"
        }
        
        // Если это не сегодня и не завтра, форматируем дату в фрмате "1 января"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM"
        outputFormatter.locale = Locale(identifier: "ru_RU") // Устанавливаем локаль для русского языка
        
        return outputFormatter.string(from: date)
    }
}
