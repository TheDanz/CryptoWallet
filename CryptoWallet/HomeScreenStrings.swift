enum HomeScreenStrings: String {
    case headerText = "headerText"
    case subheaderText = "subheaderText"
    case learnMoreText = "learnMoreText"
    case trendingListHeaderText = "trendingListHeaderText"
    case update = "update"
    case exit = "exit"
    
    func localized() -> String { rawValue.localized() }
}
