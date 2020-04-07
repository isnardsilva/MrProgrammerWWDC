import UIKit

public class GoalView: UIView {
    // MARK: - Properties
    public weak var titleLabel: UILabel!
    public weak var messageLabel: UILabel!
    public weak var goalCollectionView: UICollectionView!
    public weak var timeLabel: UILabel!
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

        setupTitleLabel()
        setupMessageLabel()
        setupGoalCollectionView()
        setupTimeMessage()
        setupTutorialAlert()
//        setupGoButton()
    }
    
    private func setupTitleLabel() {
        let titleLbl = UILabel()
        self.addSubview(titleLbl)
        
        titleLbl.text = "Temos um cliente!"
        titleLbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLbl.textColor = Colors.customBlue
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -190)
        ])
        
        self.titleLabel = titleLbl
    }
    
    private func setupMessageLabel() {
        let messageLbl = UILabel()
        self.addSubview(messageLbl)
        
        messageLbl.text = "Toque nas tecnologias abaixo \npara saber o que teremos no \nseu primeiro projeto:"
        messageLbl.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        messageLbl.textColor = .white
        messageLbl.textAlignment = .center
        messageLbl.numberOfLines = 0
        
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLbl.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40)
        ])
        
        self.messageLabel = messageLbl
    }
    
    private func setupGoalCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.addSubview(collectionView)
        
        collectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.23)
        ])
        
        self.goalCollectionView = collectionView
    }
    
    private func setupTimeMessage() {
        
        let label = UILabel()
        self.addSubview(label)

        label.text = "🗓Tempo: 30 dias"
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.textColor = .green
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.goalCollectionView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        ])
        
        self.timeLabel = label
    }
        
    public func hideOtherElementsForTheTutorial(hidden: Bool, selectedCell: UICollectionViewCell) {
        let newAlpha: CGFloat = (hidden) ? 0.05 : 1.0
        
        self.titleLabel.alpha = newAlpha
        self.messageLabel.alpha = newAlpha
        self.timeLabel.alpha = newAlpha
        
        
        for cell in goalCollectionView.visibleCells {
            if cell != selectedCell {
                cell.alpha = newAlpha
            }
        }
        
        self.tutorialAlert.isHidden = !hidden
        self.goalCollectionView.isUserInteractionEnabled = !hidden
    }
    
    
    
    private func setupTutorialAlert() {
        let ttAlert = TutorialAlert()
        self.addSubview(ttAlert)
        
        self.tutorialAlert = ttAlert
    }
}
