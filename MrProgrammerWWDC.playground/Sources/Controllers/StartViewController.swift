import UIKit

public class StartViewController: UIViewController {
    // MARK: - Properties
    public var startView: StartView!
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
        // Instanciando a View
        startView = StartView()
        view = startView
        
        // Add acao que sera executada quando for tocado o botao de START
        startView.startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func startGame() {
        print("StartGame")
    }
    
    // MARK: - Navigation
}
