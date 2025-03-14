import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, tableName: "HomeScreenStrings", bundle: .main, comment: String())
    }
}
