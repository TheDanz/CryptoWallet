import os
import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Views
    
    private lazy var logoImageView = {
        let imageView = UIImageView()
        imageView.image = .robotLogo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginInputView = {
        let inputView = CredentialsInputView(
            image: .userIcon,
            placeholder: LoginScreenStrings.loginPlaceholder.localized()
        )
        inputView.translatesAutoresizingMaskIntoConstraints = false
        return inputView
    }()
    
    private lazy var passwordInputView = {
        let inputView = CredentialsInputView(
            image: .passwordIcon,
            placeholder: LoginScreenStrings.passwordPlaceholder.localized(),
            isSecureTextEntry: true
        )
        inputView.translatesAutoresizingMaskIntoConstraints = false
        return inputView
    }()
    
    private lazy var loginButton = {
        let button = UIButton()
        button.setTitle(LoginScreenStrings.loginButtonText.localized(), for: .normal)
        button.titleLabel?.font = .semiBold15
        button.setTitleColor(.whiteText, for: .normal)
        button.backgroundColor = .dark
        button.layer.cornerRadius = 27.5
        button.layer.shadowColor = UIColor.darkWithAlpha.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 20)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Button Actions
    
    @objc
    private func loginButtonClick() {
        
        let keychainService = KeychainService()
        let password = keychainService.getPassword(service: "Credentials", account: loginInputView.textField.text ?? "")
        
        if password != nil {
            if password == passwordInputView.textField.text {
                var userDefaults = UserDefaultsService()
                userDefaults.isLoggedIn = true
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(TabBarController())
                logger.info("Success login")
            } else {
                let alert = AlertFactory.createOKAlert(title: LoginScreenStrings.wrongPasswordAlertText.localized())
                present(alert, animated: true)
                logger.info("Wrong password")
            }
        } else {
            let alert = AlertFactory.createOKAlert(title: LoginScreenStrings.noSuchUserAlertText.localized())
            present(alert, animated: true)
            logger.info("There is no such user")
        }
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupLogoImageView()
        setupLoginButton()
        setupPasswordInputView()
        setupLoginInputView()
    }
    
    private func setupView() {
        view.backgroundColor = .mainBackground
        view.addSubview(logoImageView)
        view.addSubview(loginInputView)
        view.addSubview(passwordInputView)
        view.addSubview(loginButton)
    }
    
    private func setupLogoImageView() {
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
    }
    
    private func setupLoginInputView() {
        loginInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        loginInputView.bottomAnchor.constraint(equalTo: passwordInputView.topAnchor, constant: -15).isActive = true
        loginInputView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setupPasswordInputView() {
        passwordInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        passwordInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        passwordInputView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -25).isActive = true
        passwordInputView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}

private let logger = Logger()
