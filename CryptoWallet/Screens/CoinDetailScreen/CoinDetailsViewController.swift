import UIKit

final class CoinDetailsViewController: UIViewController {
    
    // MARK: Views
    
    private lazy var backButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .whiteTranslucentBackground
        button.setImage(.leftArrow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var titleLabel = {
        let label = UILabel()
        label.font = .smallPercentage
        label.textColor = .dark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var valueLabel = {
        let label = UILabel()
        label.font = .bigNumber
        label.textColor = .dark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trendVolatilityStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var volatilityLabel = {
        let label = UILabel()
        label.textColor = .mountainMist
        label.font = .smallPercentage
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var trendImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var timeRangeControl = {
        let control = TimeRangeControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var statisticView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .whiteTranslucentBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var statisticHeaderLabel = {
        let label = UILabel()
        label.text = CoinDetailsScreenStrings.statisticHeaderText.localized()
        label.font = .header2
        label.textColor = .dark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var capitalizationHeaderLabel = {
        let label = UILabel()
        label.text = CoinDetailsScreenStrings.capitalizationHeaderText.localized()
        label.font = .smallPercentage
        label.textColor = .mountainMist
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var capitalizationValueLabel = {
        let label = UILabel()
        label.font = .tabActive
        label.textColor = .dark
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var suplyHeaderLabel = {
        let label = UILabel()
        label.text = CoinDetailsScreenStrings.suplyHeaderText.localized()
        label.font = .smallPercentage
        label.textColor = .mountainMist
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var suplyValueLabel = {
        let label = UILabel()
        label.font = .tabActive
        label.textColor = .dark
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Inits
    
    init(
        fullName: String,
        shortName: String,
        value: Double,
        volatility: Double,
        capitalizationValue: Double,
        supplyValue: Double
    ) {
        self.titleLabel.text = "\(fullName) (\(shortName))"
        self.valueLabel.text = Formatters.formattedCurrency(amount: value)
        self.volatilityLabel.text = Formatters.formattedPercentage(from: volatility)
        self.trendImageView.image = volatility >= 0 ? .arrowUp : .arrowDown
        self.capitalizationValueLabel.text = Formatters.formattedCurrencyWithoutFraction(amount: capitalizationValue)
        self.suplyValueLabel.text = "\(Int(supplyValue)) (\(shortName))"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc
    private func backButtonClick() {
        if let viewControllers = navigationController?.viewControllers, viewControllers.count > 1 {
            navigationController?.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
        }
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupNavigationBar()
        setupBackButton()
        setupTitleLabel()
        setupValueLabel()
        setupTrendVolatilityStackView()
        setupVolatilityLabel()
        setupTrendImageView()
        setupTimeRangeControl()
        setupStatisticView()
        setupStatisticHeaderLabel()
        setupCapitalizationHeaderLabel()
        setupCapitalizationValueLabel()
        setupSuplyHeaderLabel()
        setupSuplyValueLabel()
    }
    
    private func setupView() {
        view.backgroundColor = .mainBackground
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(valueLabel)
        view.addSubview(trendVolatilityStackView)
        view.addSubview(timeRangeControl)
        view.addSubview(statisticView)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupBackButton() {
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func setupTitleLabel() {
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
    }
    
    private func setupValueLabel() {
        valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setupTrendVolatilityStackView() {
        trendVolatilityStackView.addArrangedSubview(trendImageView)
        trendVolatilityStackView.addArrangedSubview(volatilityLabel)
        trendVolatilityStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        trendVolatilityStackView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor).isActive = true
    }
    
    private func setupVolatilityLabel() {
        volatilityLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setupTrendImageView() {
        trendImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        trendImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    private func setupTimeRangeControl() {
        timeRangeControl.topAnchor.constraint(equalTo: volatilityLabel.bottomAnchor, constant: 20).isActive = true
        timeRangeControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        timeRangeControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        timeRangeControl.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupStatisticView() {
        statisticView.addSubview(statisticHeaderLabel)
        statisticView.addSubview(capitalizationHeaderLabel)
        statisticView.addSubview(capitalizationValueLabel)
        statisticView.addSubview(suplyHeaderLabel)
        statisticView.addSubview(suplyValueLabel)
        statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        statisticView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        statisticView.heightAnchor.constraint(equalToConstant: 242).isActive = true
    }
    
    private func setupStatisticHeaderLabel() {
        statisticHeaderLabel.topAnchor.constraint(equalTo: statisticView.topAnchor, constant: 25).isActive = true
        statisticHeaderLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25).isActive = true
        statisticHeaderLabel.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -25).isActive = true
        statisticHeaderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupCapitalizationHeaderLabel() {
        capitalizationHeaderLabel.topAnchor.constraint(equalTo: statisticHeaderLabel.bottomAnchor, constant: 15).isActive = true
        capitalizationHeaderLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25).isActive = true
        capitalizationHeaderLabel.trailingAnchor.constraint(equalTo: capitalizationValueLabel.leadingAnchor).isActive = true
        capitalizationHeaderLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setupCapitalizationValueLabel() {
        capitalizationValueLabel.centerYAnchor.constraint(equalTo: capitalizationHeaderLabel.centerYAnchor).isActive = true
        capitalizationValueLabel.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -25).isActive = true
        capitalizationValueLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setupSuplyHeaderLabel() {
        suplyHeaderLabel.topAnchor.constraint(equalTo: capitalizationHeaderLabel.bottomAnchor, constant: 15).isActive = true
        suplyHeaderLabel.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 25).isActive = true
        suplyHeaderLabel.trailingAnchor.constraint(equalTo: suplyValueLabel.leadingAnchor).isActive = true
        suplyHeaderLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    private func setupSuplyValueLabel() {
        suplyValueLabel.centerYAnchor.constraint(equalTo: suplyHeaderLabel.centerYAnchor).isActive = true
        suplyValueLabel.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -25).isActive = true
        suplyValueLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
}
