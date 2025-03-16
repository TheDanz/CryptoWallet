import Foundation

enum Formatters {
    
    /// Depends on Region
    static func formattedCurrency(from value: Double, minFractionDigits: Int = 2, maxFractionDigits: Int = 2) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = minFractionDigits
        formatter.maximumFractionDigits = maxFractionDigits
        
        return formatter.string(from: NSNumber(value: value))
    }
    
    /// Not depends on Region
    static func formattedCurrency(amount: Double) -> String {

        let roundedAmount = String(format: "%.2f", amount)
        let components = roundedAmount.split(separator: ".")
        let integerPart = String(components[0])
        let decimalPart = components.count > 1 ? String(components[1]) : "00"
        
        var result = ""
        var count = 0
        
        for character in integerPart.reversed() {
            if count > 0 && count % 3 == 0 {
                result.insert(",", at: result.startIndex)
            }
            result.insert(character, at: result.startIndex)
            count += 1
        }
        
        return "$" + result + "." + decimalPart
    }
    
    /// Not depends on Region
    static func formattedCurrencyWithoutFraction(amount: Double) -> String {
        let integerPart = Int(amount)
        
        var formattedString = "$"
        let numberString = String(integerPart)
        
        var result = ""
        var count = 0
        
        for character in numberString.reversed() {
            if count > 0 && count % 3 == 0 {
                result.insert(",", at: result.startIndex)
            }
            result.insert(character, at: result.startIndex)
            count += 1
        }
        
        formattedString += result
        return formattedString
    }

    static func formattedPercentage(from value: Double) -> String {
        let roundedValue = abs(Double(round(10 * value) / 10))
        
        return String(format: "%.1f%%", roundedValue)
    }
}
