enum CoinDetailsScreenStrings: String {
    
    static let tableName = "CoinDetailsScreenStrings"
    
    case statisticHeaderText = "statistic_header_text"
    case capitalizationHeaderText = "capitalization_header_text"
    case suplyHeaderText = "suply_header_text"
    
    func localized() -> String { rawValue.localized(tableName: Self.tableName) }
}
