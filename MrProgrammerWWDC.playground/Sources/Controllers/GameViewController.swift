import UIKit

public class GameViewController: UIViewController {
    // MARK: - Properties
    public var gameView: GameView {
        return (view as! GameView)
    }

    public let goals: [String] = ["Swift", "SwiftUI", "iMessage", "HealthKit", "CloudKit", "WatchKit"]
    public var goalsAtMoment: Int = 6
    private let sectionInsetsGoals = UIEdgeInsets(top: 0.0, left: 15, bottom: 0, right: 15)
    private let itemsPerRowGoals: CGFloat = 3

    public let allTechnologies: [String] = SymbolData.getAllSymbols()
    private let sectionInsetsAllTechnologies = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    private let itemsPerRowAllTechnologies: CGFloat = 4

    
    
    
    
    
    
    
    
//    private let headerView: UIView = UIView()
//
//    private var titleLabel: UILabel!
//    private var timeLeftLabel: UILabel!
    
//    private var tasksCollectionView: UICollectionView!
//    private var symbolsCollectionView: UICollectionView!
    
//    private let sectionInsetsSymbols = UIEdgeInsets(top: 10.0, left: 15, bottom: 10.0, right: 15)
////    private let sectionInsetsGoals = UIEdgeInsets(top: 0.0, left: 10, bottom: 10.0, right: 10)
//    private let itemsPerRow: CGFloat = 4
//    private let numberOfItems: Int = 28
//
//    private var symbols: [String] = SymbolData.getAllSymbols()
//    private var tasks: [String] = SymbolData.getAllSymbols()
//    private var tasksAtMoment: Int = 4
    
    // Temporizador
    private var timer: Timer?
    private var timeLeft: Int?
    
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        self.view = GameView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameView.goalCollectionView.dataSource = self
        self.gameView.goalCollectionView.delegate = self
        
        self.gameView.allTechnologiesCollectionView.dataSource = self
        self.gameView.allTechnologiesCollectionView.delegate = self
        
        self.starTime()
    }
    
    private func starTime() {
        self.timeLeft = 30
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc private func onTimerFires() {
        if timeLeft == 30 {
            self.gameView.timeLeftLabel.textColor = .green
        } else if timeLeft == 10 {
            self.gameView.timeLeftLabel.textColor = .red
        }
        
        timeLeft! -= 1
        
        self.gameView.timeLeftLabel.text = "🗓 \(timeLeft!) dias"
        
        if timeLeft! <= 0 {
            timer?.invalidate()
            timer = nil
//            self.showUIAlert(win: false)
            print("Perdeu")
        }
    }
    
    
    
//    private func showUIAlert(win: Bool) {
//        let title: String
//        let message: String
//
//        if win {
//            title = "Parabéns!"
//            message = "Você conseguiu implementar tudo que o cliente pediu!"
//        } else {
//            title = "Fim do prazo!"
//            message = "Pena que você nao conseguiu entregar esse projeto! Nem sempre um projeto sai como esperavamos! Bola pra frente!"
//        }
//
//
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
//            if !win {
////                self.reloadGame()
//            }
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//    }
}


// MARK: - UICollectionViewFlowLayout
extension GameViewController: UICollectionViewDelegateFlowLayout {
    // Informa o tamanho de uma determinada celula
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let sectionInsets: UIEdgeInsets
        let itemsPerRow: CGFloat

        // Verificando qual e a Collection View que esta sendo referenciada
        if collectionView == gameView.allTechnologiesCollectionView {
            sectionInsets = sectionInsetsAllTechnologies
            itemsPerRow = itemsPerRowAllTechnologies
        } else {
            sectionInsets = sectionInsetsGoals
            itemsPerRow = itemsPerRowGoals
        }

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
        let sectionInsets = (collectionView == gameView.allTechnologiesCollectionView ? sectionInsetsAllTechnologies : sectionInsetsGoals)
        return sectionInsets
    }

    // Informa o espacamento entre cada linha do layout
    // No nosso caso sera o espacamento na (horizontal)
    // Esse valor corresponde ao valor do espacamento esq/dir
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let sectionInsets = (collectionView == gameView.allTechnologiesCollectionView ? sectionInsetsAllTechnologies : sectionInsetsGoals)
        return sectionInsets.left
    }

}


// MARK: - UICollectionViewDataSource
extension GameViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = (collectionView == gameView.allTechnologiesCollectionView) ? allTechnologies.count : goals.count
        return numberOfItems
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Verificar qual e a Collection View que esta sendo referenciada
        guard collectionView == gameView.allTechnologiesCollectionView else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalViewCell.reuseIdentifier, for: indexPath) as! GoalViewCell

            cell.symbolImageView.image = UIImage(named: "Symbols/\(goals[indexPath.row])")

            return cell
        }


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TecnologyViewCell.reuseIdentifier, for: indexPath) as! TecnologyViewCell

//        cell.backgroundImageView.image = UIImage(named: "TechButtonNormal")
        cell.symbolImageView.image = UIImage(named: "Symbols/\(allTechnologies[indexPath.row])")

        return cell
    }
}



extension GameViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Touch")
        
        let tecnology = allTechnologies[indexPath.row]
        
        for index in 0 ..< goals.count {
            if tecnology == goals[index] {
                self.gameView.allTechnologiesCollectionView.cellForItem(at: indexPath)?.alpha = 0
                self.gameView.goalCollectionView.cellForItem(at: IndexPath(row: index, section: 0))?.alpha = 0.05
                self.goalsAtMoment -= 1
            }
        }
        
        if goalsAtMoment == 0 {
//            print("Ganhou")
            
            self.timer!.invalidate()
            self.timer = nil
            
            let finalMessagePageViewController = FinalMessagePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            self.navigationController?.pushViewController(finalMessagePageViewController, animated: true)
        }
    }
}
