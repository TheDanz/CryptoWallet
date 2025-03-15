enum LoginScreenStrings: String {
    
    static let tableName = "LoginScreenStrings"
    
    case loginPlaceholder = "loginPlaceholder"
    case passwordPlaceholder = "passwordPlaceholder"
    case loginButtonText = "loginButtonText"
    
    func localized() -> String { rawValue.localized(tableName: Self.tableName) }
}
