import UIKit

final class TimeRangeControl: UIControl {
    
    // MARK: Properties
    
    private var items: [String] = ["24H", "1W", "1Y", "ALL", "Point"]
    
    private var itemLabels: [UILabel] = []
    private var selectedView = UIView()
        
    private var selectedIndex: Int = 0 {
        didSet { updateSelectedItemWithAnimation() }
    }
    
    private var selectedLabelColor = UIColor.dark
    private var selectedViewBackgroundColor: UIColor = .whiteTranslucentBackground
    private var unselectedLabelColor = UIColor.manatee
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        setupView()
        setupItemLabels()
        setupConstraints()
    }
    
    private func setupView() {
        layer.cornerRadius = 30
        backgroundColor = .solitude
        addSubview(selectedView)
    }
    
    private func setupItemLabels() {
        for i in 0..<items.count {
            let label = UILabel()
            label.text = items[i]
            label.textAlignment = .center
            label.font = .tabActive
            label.textColor = i == 0 ? selectedLabelColor : unselectedLabelColor
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
            itemLabels.append(label)
        }
    }
    
    private func setupConstraints() {
        
        for (i, label) in itemLabels.enumerated() {
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true

            if i == 0 {
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
            } else {
                label.leadingAnchor.constraint(equalTo: itemLabels[i - 1].trailingAnchor, constant: 4).isActive = true
                label.widthAnchor.constraint(equalTo: itemLabels[0].widthAnchor).isActive = true
            }

            if i == items.count - 1 {
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
            } else {
                label.trailingAnchor.constraint(equalTo: itemLabels[i + 1].leadingAnchor, constant: -4).isActive = true
            }
        }
    }
    
    // MARK: UIView LifeCycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        let selectedLabel = itemLabels[selectedIndex]
        selectedLabel.textColor = selectedLabelColor
        selectedView.frame = selectedLabel.frame
        selectedView.backgroundColor = selectedViewBackgroundColor
        selectedView.layer.cornerRadius = 25
        updateSelectedItemWithAnimation()
    }
    
    // MARK: UIControl Methods
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchedLocation = touch.location(in: self)
        
        for (index, itemLabel) in itemLabels.enumerated() {
            if itemLabel.frame.contains(touchedLocation) {
                selectedIndex = index
                break
            }
        }
        
        return false
    }
    
    // MARK: Private funcs
    
    private func updateSelectedItemWithAnimation() {
        
        for itemLabel in itemLabels {
            itemLabel.textColor = unselectedLabelColor
        }
        
        let selectedLabel = itemLabels[selectedIndex]
        selectedLabel.textColor = selectedLabelColor
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1
        ) {
            self.selectedView.frame = selectedLabel.frame
        }
    }
}
