import UIKit

public class GoalViewController: UIViewController {
    // MARK: - Properties
    public var goalView: GoalView {
        return (view as! GoalView)
    }
    
    public var selectedCell: UICollectionViewCell?
    
//    public var goalCollectionView: UICollectionView!
    
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 20, bottom: 10.0, right: 20)
    private let itemsPerRow: CGFloat = 3
    
    public let goals: [String] = ["Swift", "SwiftUI", "iMessage", "HealthKit", "CloudKit", "WatchKit"]
    public let messages: [String] = [
        "Linguagem de programação que será utilizada no projeto. Ela é simples e eficiente.",
        "Usaremos para criar a interface gráfica a ser exibida para o usuário.",
        "Vamos detectar quando o enviarmos um código de confirmação para o usuário.",
        "Precisamos saber como está a saúde do usuário.",
        "Vamos manter os dados do aplicativo na núvem.",
        "De brinde, vamos oferecer uma versão mais simples para Apple Watch."]
    
    
    
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
        view = GoalView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goalView.goalCollectionView.dataSource = self
        self.goalView.goalCollectionView.delegate = self
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Verificando se o tutorial esta sendo exibido
        if !self.goalView.tutorialAlert.isHidden {
            self.goalView.hideOtherElementsForTheTutorial(hidden: false, selectedCell: self.selectedCell!)
        }
        
    }
}




extension GoalViewController: UICollectionViewDelegateFlowLayout {
    // Informa o tamanho de uma determinada celula
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Espacamento entre cada celula
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        // Espaco disponivel para exibir o conteudo de cada celula
//        let availableWidth = view.frame.width - paddingSpace
        let availableWidth = collectionView.frame.width - paddingSpace
        // Largura de cada celula
        let widthPerItem = availableWidth / itemsPerRow

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
        self.selectedCell = collectionView.cellForItem(at: indexPath)!
        
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let cellRect = attributes?.frame
        let cellFrameInSuperview = collectionView.convert(cellRect!, to: self.view)
        
//        self.tutorialAlert.show(cellFrameInSuperview: cellFrameInSuperview)
        self.goalView.hideOtherElementsForTheTutorial(hidden: true, selectedCell: selectedCell!)
        
        self.goalView.tutorialAlert.show(title: self.goals[indexPath.row],
                                         message: self.messages[indexPath.row],
                                         cellFrameInSuperview: cellFrameInSuperview)
    }
}
