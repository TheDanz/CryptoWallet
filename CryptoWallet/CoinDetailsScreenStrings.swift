enum CoinDetailsScreenStrings: String {
    
    static let tableName = "CoinDetailsScreenStrings"
    
    case statisticHeaderText = "statisticHeaderText"
    case capitalizationHeaderText = "capitalizationHeaderText"
    case suplyHeaderText = "suplyHeaderText"
    
    func localized() -> String { rawValue.localized(tableName: Self.tableName) }
}
