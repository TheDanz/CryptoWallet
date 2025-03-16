enum HomeScreenStrings: String {
    
    static let tableName = "HomeScreenStrings"
    
    case headerText = "header_text"
    case subheaderText = "subheader_text"
    case learnMoreText = "learn_more_text"
    case trendingListHeaderText = "trending_list_header_text"
    case update = "update"
    case exit = "exit"
    case descSort = "desc_sort"
    case ascSort = "asc_sort"
    
    func localized() -> String { rawValue.localized(tableName: Self.tableName) }
}
