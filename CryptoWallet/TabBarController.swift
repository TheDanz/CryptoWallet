import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupTabBar()
        setupTabBarItemImages()
    }
    
    // MARK: Private Funcs
    
    private func setupViewControllers() {
        
        let homeVC = HomeViewController()
        let quotesVC = UIViewController()
        let walletVC = UIViewController()
        let documentsVC = UIViewController()
        let profileVC = UIViewController()
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        setViewControllers([homeNC, quotesVC, walletVC, documentsVC, profileVC], animated: false)
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .ebonyClay
        tabBar.unselectedItemTintColor = .unselectedTabBarItem
        tabBar.backgroundColor = .whiteText
    }
    
    private func setupTabBarItemImages() {
        if let items = tabBar.items {
            let images: [UIImage] = [.tabHome, .tabQuotes, .tabWallet, .tabDocuments, .tabProfile]
            for i in 0..<items.count {
                items[i].image = images[i]
                items[i].imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
            }
        }
    }
}
