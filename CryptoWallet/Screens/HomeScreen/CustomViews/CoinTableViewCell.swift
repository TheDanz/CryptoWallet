import UIKit

final class CoinTableViewCell: UITableViewCell {
    
    static let identifier = "CoinTableViewCell"
    
    // MARK: Views
    
    private lazy var coinImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullNameLabel = {
        let label = UILabel()
        label.textColor = .ebonyClay
        label.font = .header3
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shortNameLabel = {
        let label = UILabel()
        label.textColor = .mountainMist
        label.font = .smallPercentage
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel = {
        let label = UILabel()
        label.textColor = .ebonyClay
        label.font = .header3
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var volatilityLabel = {
        let label = UILabel()
        label.textColor = .mountainMist
        label.font = .smallPercentage
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trendImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupCoinImageView()
        setupFullNameLabel()
        setupShortNameLabel()
        setupValueLabel()
        setupVolatilityLabel()
        setuptrendImageView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(coinImageView)
        addSubview(fullNameLabel)
        addSubview(shortNameLabel)
        addSubview(valueLabel)
        addSubview(volatilityLabel)
        addSubview(trendImageView)
    }
    
    private func setupCoinImageView() {
        coinImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        coinImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coinImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupFullNameLabel() {
        fullNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -11.5).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 19).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setupShortNameLabel() {
        shortNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 14.5).isActive = true
        shortNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 19).isActive = true
        shortNameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setupValueLabel() {
        valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -11.5).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setupVolatilityLabel() {
        volatilityLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 14.5).isActive = true
        volatilityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        volatilityLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setuptrendImageView() {
        trendImageView.centerYAnchor.constraint(equalTo: volatilityLabel.centerYAnchor).isActive = true
        trendImageView.trailingAnchor.constraint(equalTo: volatilityLabel.leadingAnchor, constant: -6).isActive = true
    }
    
    // MARK: Configure
    
    func configure(
        image: UIImage,
        fullName: String,
        shortName: String,
        value: Double,
        volatility: Double
    ) {
        self.coinImageView.image = image
        self.fullNameLabel.text = fullName
        self.shortNameLabel.text = shortName
        self.valueLabel.text = Formatters.formattedCurrency(amount: value)
        self.volatilityLabel.text = Formatters.formattedPercentage(from: volatility)
        self.trendImageView.image = volatility >= 0 ? .arrowUp : .arrowDown
    }
}
