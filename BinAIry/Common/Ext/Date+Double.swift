import Foundation

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

extension Double {
    func formattedNumber(digits: Int = 2) -> String {
        return String(format: "%.\(digits)f", self)
    }
    
    func formattedToShortStyle() -> String {
        let absValue = abs(self)
        let sign = self < 0 ? "-" : ""
        
        switch absValue {
        case 1_000_000_000...:
            return String(format: "%@%.2fB", sign, absValue / 1_000_000_000) // Форматируем в миллиарды (B)
        case 1_000_000...:
            return String(format: "%@%.2fM", sign, absValue / 1_000_000) // Форматируем в миллионы (M)
        case 1_000...:
            return String(format: "%@%.2fK", sign, absValue / 1_000) // Форматируем в тысячи (K)
        default:
            return String(format: "%@%.0f", sign, self) // Если число меньше тысячи, показываем его как есть
        }
    }
}

extension Int {
    func formattedToShortStyle() -> String {
        return Double(self).formattedToShortStyle()
    }
}
