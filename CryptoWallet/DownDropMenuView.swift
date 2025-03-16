import UIKit

final class DropDownMenuView: UIView {
    
    // MARK: Item Class
    
    final class ItemView: UIView {
        
        private var tapAction: (() -> Void)?
        
        // MARK: Views
        
        private var imageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private var titleLabel = {
            let label = UILabel()
            label.font = .header3
            label.textColor = .ebonyClay
            label.numberOfLines = 1
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // MARK: Inits
        
        init(image: UIImage, text: String, action: (() -> Void)? = nil) {
            imageView.image = image
            titleLabel.text = text
            tapAction = action
            super.init(frame: .zero)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }
        
        // MARK: Actions
        
        @objc
        private func viewTapped() {
            tapAction?()
        }
        
        // MARK: Setup UI
        
        private func setupUI() {
            setupView()
            setupImageView()
            setupTitleLabel()
        }
        
        private func setupView() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            addGestureRecognizer(tapGestureRecognizer)
            heightAnchor.constraint(equalToConstant: 27).isActive = true
            addSubview(imageView)
            addSubview(titleLabel)
        }
        
        private func setupImageView() {
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        private func setupTitleLabel() {
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
    
    // MARK: Views
    
    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Add Items
    
    func addItem(_ item: ItemView) {
        stackView.addArrangedSubview(item)
    }
    
    func addItems(_ items: [ItemView]) {
        for item in items {
            stackView.addArrangedSubview(item)
        }
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupStackView()
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = .whiteText
        addSubview(stackView)
    }
    
    private func setupStackView() {
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
