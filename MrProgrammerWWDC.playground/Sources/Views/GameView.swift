import UIKit

public class GameView: UIView {
    // MARK: - Properties
    public weak var headerView: UIView!
    public weak var titleLabel: UILabel!
    public weak var timeLeftLabel: UILabel!
    
    public weak var goalCollectionView: UICollectionView!
    public weak var allTechnologiesCollectionView: UICollectionView!
    
    public weak var tutorialAlert: TutorialAlert!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        self.backgroundColor = Colors.backgroundColor
        
        setupHeaderView()
        setupTitleLabel()
        setupTimeLeftLabel()
        setupGoalCollectionView()
        setupAllTechnologiesCollectionView()
        setupTutorialAlert()
    }
    
    
    private func setupHeaderView() {
        let hdView = UIView()
        self.addSubview(hdView)
        
        hdView.backgroundColor = Colors.customGray
        hdView.layer.cornerRadius = 10
        
        hdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hdView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            hdView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            hdView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            hdView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.24)
        ])
        
        self.headerView = hdView
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        self.headerView.addSubview(label)
        
        label.text = "Encontre:"
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textColor = Colors.customBlue
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 15)
        ])
        
        self.titleLabel = label
    }
    
    private func setupTimeLeftLabel() {
        let label = UILabel()
        self.headerView.addSubview(label)
        
        label.text = "🗓 30 dias"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .green
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -15),
            label.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 10)
        ])
        
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        self.timeLeftLabel = label
    }
    
    private func setupGoalCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.headerView.addSubview(collectionView)
        
        collectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -30),
            collectionView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -10)
        ])
        
        collectionView.isUserInteractionEnabled = false
        
        self.goalCollectionView = collectionView
    }
    
    private func setupAllTechnologiesCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.addSubview(collectionView)
        
        collectionView.register(TecnologyViewCell.self, forCellWithReuseIdentifier: TecnologyViewCell.reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        collectionView.isScrollEnabled = false
        
        self.allTechnologiesCollectionView = collectionView
    }
    
    private func setupTutorialAlert() {
        let ttAlert = TutorialAlert()
        self.addSubview(ttAlert)
        
        ttAlert.closedButton.isHidden = true
        
        self.tutorialAlert = ttAlert
    }
}
