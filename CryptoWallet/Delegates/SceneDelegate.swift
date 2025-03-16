import os
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let keychainService = KeychainService()
    private let defaultAccount = "1234"
    private let defaultPassword = "1234"
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let userDefaults = UserDefaultsService()
        if userDefaults.isLoggedIn {
            window.rootViewController = TabBarController()
        } else {
            window.rootViewController = LoginViewController()
        }
        window.makeKeyAndVisible()
        self.window = window
        
        checkAndSaveDefaultCredentials()
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        
        guard let window = self.window else { return }
        
        if animated {
            let transition = CATransition()
            transition.type = .push
            transition.duration = 0.5
            window.layer.add(transition, forKey: kCATransition)
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func checkAndSaveDefaultCredentials() {
        if keychainService.getPassword(service: "Credentials", account: defaultAccount) == nil {
            let success = keychainService.savePassword(service: "Credentials", account: defaultAccount, password: defaultPassword)
            if success {
                logger.info("Default credentials successfully saved to Keychain")
            } else {
                logger.info("Error saving default credentials to Keychain")
            }
        } else {
            logger.info("Password for default account already exists in Keychain")
        }
    }
}

private let logger = Logger()
