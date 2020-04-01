import UIKit

public class GoalViewController: UIViewController {
    // MARK: - Properties
    public var goalView: GoalView {
        return (view as! GoalView)
    }
    
//    public var goalCollectionView: UICollectionView!
    
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 20, bottom: 10.0, right: 20)
    private let itemsPerRow: CGFloat = 3
    
    public let goals: [String] = ["Swift", "SwiftUI", "iMessage", "HealthKit", "CloudKit", "WatchKit"]
    
    
    
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
        view = GoalView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goalView.goalCollectionView.dataSource = self
        self.goalView.goalCollectionView.delegate = self
        
//        goalView.goButton.addTarget(self, action: #selector(goGame), for: .touchUpInside)
    }
    
//    // MARK: - Actions
//    @objc public func goGame() {
//        print("Go")
//    }
    
//    public override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        setupCollectionView()
//    }
    
    
    private func setupCollectionView() {
        /*
         tasksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
         tasksCollectionView.dataSource = self
         tasksCollectionView.delegate = self
         tasksCollectionView.register(TaskViewCell.self, forCellWithReuseIdentifier: SymbolViewCell.reuseIdentifier)
         
         tasksCollectionView.backgroundColor = .clear
         
         self.headerView.addSubview(tasksCollectionView)
         
         tasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
         tasksCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
         tasksCollectionView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 25).isActive = true
         tasksCollectionView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -25).isActive = true
         tasksCollectionView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
         
         tasksCollectionView.isScrollEnabled = false
         tasksCollectionView.isUserInteractionEnabled = false
         */
        
//        goalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        goalCollectionView.dataSource = self
//        goalCollectionView.delegate = self
//        goalCollectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.reuseIdentifier)
        
//        goalCollectionView.backgroundColor = .red
        
//        self.view.addSubview(goalCollectionView)
        
//        goalCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            goalCollectionView.topAnchor.constraint(equalTo: self.goalView.messageLabel.bottomAnchor, constant: 20),
//            goalCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
//            goalCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
//            goalCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.23)
//        ])
        
    }
}




extension GoalViewController: UICollectionViewDelegateFlowLayout {
    // Informa o tamanho de uma determinada celula
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let sectionInsets = (collectionView == symbolsCollectionView ? sectionInsetsSymbols : sectionInsetsGoals)
        
        // Espacamento entre cada celula
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        // Espaco disponivel para exibir o conteudo de cada celula
//        let availableWidth = view.frame.width - paddingSpace
        let availableWidth = collectionView.frame.width - paddingSpace
        // Largura de cada celula
        let widthPerItem = availableWidth / itemsPerRow

//        print(widthPerItem)

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    // Informa o espacamento entre as CELULAS, CABECALHOS e RODAPES
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsetsSymbols
//        let sectionInsets = (collectionView == symbolsCollectionView ? sectionInsetsSymbols : sectionInsetsGoals)
        return sectionInsets
    }

    // Informa o espacamento entre cada linha do layout
    // No nosso caso sera o espacamento na (horizontal)
    // Esse valor corresponde ao valor do espacamento esq/dir
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        let sectionInsets = (collectionView == symbolsCollectionView ? sectionInsetsSymbols : sectionInsetsGoals)
        return sectionInsets.left
    }
}


// MARK: - UICollectionViewDataSource
extension GoalViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goals.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalViewCell.reuseIdentifier, for: indexPath) as! GoalViewCell
        
        cell.symbolImageView.image = UIImage(named: "Symbols/\(goals[indexPath.row])")
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension GoalViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(goals[indexPath.row])
    }
}
