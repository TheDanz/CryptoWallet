import UIKit

final class CredentialsInputView: UIView {
    
    // MARK: Views
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.font = .regular15
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: Inits
    
    init(image: UIImage, placeholder: String, isSecureTextEntry: Bool = false) {
        imageView.image = image
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureTextEntry
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupImageView()
        setupTextField()
    }
    
    private func setupView() {
        layer.cornerRadius = 25
        backgroundColor = .whiteTranslucentBackground
        addSubview(imageView)
        addSubview(textField)
    }
    
    private func setupImageView() {
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func setupTextField() {
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
