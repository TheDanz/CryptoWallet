import UIKit

enum AlertFactory {
    
    static func createOKAlert(title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionOK)
        return alert
    }
}
