import Foundation

extension String {
    func localized(tableName: String) -> String {
        NSLocalizedString(self, tableName: tableName, bundle: .main, comment: String())
    }
}
