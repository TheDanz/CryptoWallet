import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: Views
    
    private lazy var headerLabel = {
        let label = UILabel()
        label.text = HomeScreenStrings.headerText.localized()
        label.font = .header1
        label.textColor = .whiteText
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subheaderLabel = {
        let label = UILabel()
        label.text = HomeScreenStrings.subheaderText.localized()
        label.font = .header2
        label.textColor = .whiteText
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dotsButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setImage(.dots, for: .normal)
        button.backgroundColor = .whiteTranslucentBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var dropDownMenuView = {
        let dropDownMenuView = DropDownMenuView()
        dropDownMenuView.isHidden = true
        dropDownMenuView.translatesAutoresizingMaskIntoConstraints = false
        return dropDownMenuView
    }()
    
    private lazy var learnMoreButton = {
        let button = UIButton()
        button.layer.cornerRadius = 17.5
        button.setTitle(HomeScreenStrings.learnMoreText.localized(), for: .normal)
        button.titleLabel?.font = .tabActive
        button.titleLabel?.numberOfLines = 1
        button.setTitleColor(.ebonyClay, for: .normal)
        button.backgroundColor = .learnMoreButtonBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var boxObjectImageView = {
        let imageView = UIImageView()
        imageView.image = .boxObject
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var trendingListView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .trendingListViewBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var trendingListHeaderLabel = {
        let label = UILabel()
        label.text = HomeScreenStrings.trendingListHeaderText.localized()
        label.font = .header2
        label.textColor = .dark
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sortButton = {
        let button = UIButton()
        button.setImage(.sortIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var coinsTableView = {
        let tableView = UITableView()
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Buttons Actions
    
    @objc
    private func dotsButtonClick() {
        dropDownMenuView.isHidden.toggle()
    }
    
    @objc
    private func sortButtonClick() {
        sortButton.transform = sortButton.transform.scaledBy(x: 1, y: -1)
    }
    
    @objc
    private func learnMoreButtonClick() { }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupHeaderLabel()
        setupSubheaderLabel()
        setupDotsButton()
        setupDropDownMenu()
        setupLearnMoreButton()
        setupBoxObjectImageView()
        setupTrendingListView()
        setupTrendingListHeaderLabel()
        setupSortButton()
        setupCoinsTableView()
    }
    
    private func setupView() {
        view.addSubview(headerLabel)
        view.addSubview(subheaderLabel)
        view.addSubview(dotsButton)
        view.addSubview(learnMoreButton)
        view.addSubview(boxObjectImageView)
        view.addSubview(trendingListView)
        view.addSubview(dropDownMenuView)
        view.backgroundColor = .sweetPink
    }
        
    private func setupHeaderLabel() {
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: dotsButton.leadingAnchor, constant: -10).isActive = true
    }
    
    private func setupSubheaderLabel() {
        subheaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 46).isActive = true
        subheaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        subheaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    private func setupDotsButton() {
        dotsButton.addTarget(self, action: #selector(dotsButtonClick), for: .touchUpInside)
        dotsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dotsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        dotsButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        dotsButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func setupDropDownMenu() {
        let updateItem = DropDownMenuView.ItemView(image: .rocketIcon, text: "Обновить")
        let exitItem = DropDownMenuView.ItemView(image: .trashIcon, text: "Выйти") {
            var userDefaults = UserDefaultsService()
            userDefaults.isLoggedIn = false
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(LoginViewController())
        }
        dropDownMenuView.addItems([updateItem, exitItem])
        dropDownMenuView.topAnchor.constraint(equalTo: dotsButton.bottomAnchor, constant: 8).isActive = true
        dropDownMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56).isActive = true
        dropDownMenuView.widthAnchor.constraint(equalToConstant: 157).isActive = true
    }
    
    private func setupLearnMoreButton() {
        learnMoreButton.addTarget(self, action: #selector(learnMoreButtonClick), for: .touchUpInside)
        learnMoreButton.topAnchor.constraint(equalTo: subheaderLabel.bottomAnchor, constant: 12).isActive = true
        learnMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        learnMoreButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        learnMoreButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func setupBoxObjectImageView() {
        boxObjectImageView.topAnchor.constraint(equalTo: dotsButton.bottomAnchor, constant: 21).isActive = true
        boxObjectImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 56).isActive = true
        boxObjectImageView.widthAnchor.constraint(equalToConstant: 242).isActive = true
        boxObjectImageView.heightAnchor.constraint(equalToConstant: 242).isActive = true
    }
    
    private func setupTrendingListView() {
        trendingListView.addSubview(trendingListHeaderLabel)
        trendingListView.addSubview(sortButton)
        trendingListView.addSubview(coinsTableView)
        trendingListView.topAnchor.constraint(equalTo: learnMoreButton.bottomAnchor, constant: 55).isActive = true
        trendingListView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trendingListView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trendingListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupTrendingListHeaderLabel() {
        trendingListHeaderLabel.topAnchor.constraint(equalTo: trendingListView.topAnchor, constant: 24).isActive = true
        trendingListHeaderLabel.leadingAnchor.constraint(equalTo: trendingListView.leadingAnchor, constant: 25).isActive = true
    }
    
    private func setupSortButton() {
        sortButton.addTarget(self, action: #selector(sortButtonClick), for: .touchUpInside)
        sortButton.topAnchor.constraint(equalTo: trendingListView.topAnchor, constant: 30).isActive = true
        sortButton.trailingAnchor.constraint(equalTo: trendingListView.trailingAnchor, constant: -25).isActive = true
    }
    
    private func setupCoinsTableView() {
        coinsTableView.delegate = self
        coinsTableView.dataSource = self
        coinsTableView.topAnchor.constraint(equalTo: trendingListHeaderLabel.bottomAnchor, constant: 16).isActive = true
        coinsTableView.leadingAnchor.constraint(equalTo: trendingListView.leadingAnchor).isActive = true
        coinsTableView.trailingAnchor.constraint(equalTo: trendingListView.trailingAnchor).isActive = true
        coinsTableView.bottomAnchor.constraint(equalTo: trendingListView.bottomAnchor).isActive = true
    }
}

// MARK: TableViewDelegate & TableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier) as? CoinTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(
            image: UIImage(systemName: "eye")!,
            fullName: String(Int.random(in: 1...1000)),
            shortName: String(Int.random(in: 1...1000)),
            value: String(Int.random(in: 1...1000)),
            volatility: String(Int.random(in: 1...1000)),
            trend: Bool.random()
        )
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CoinDetailsViewController(
            fullName: "Etherium",
            shortName: "ETH",
            value: "32,128.80",
            volatility: "2.5",
            trend: true,
            capitalizationValue: "231,233",
            supplyValue: "114.211"
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
