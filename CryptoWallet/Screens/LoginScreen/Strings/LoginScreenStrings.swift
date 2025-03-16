enum LoginScreenStrings: String {
    
    static let tableName = "LoginScreenStrings"
    
    case loginPlaceholder = "login_placeholder"
    case passwordPlaceholder = "password_placeholder"
    case loginButtonText = "login_button_text"
    case wrongPasswordAlertText = "wrong_password_alert_text"
    case noSuchUserAlertText = "no_such_user_alert_text"
    
    func localized() -> String { rawValue.localized(tableName: Self.tableName) }
}
