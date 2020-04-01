import UIKit

public class StartViewController: UIViewController {
    // MARK: - Properties
    public var startView: StartView {
        return (view as! StartView)
    }
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
        // Instanciando a View
        view = StartView()
        
        // Add acao que sera executada quando for tocado o botao de START
        startView.startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func startGame() {
//        print("StartGame")
//        self.navigationController?.pushViewController(MessageViewController(), animated: true)
        
        let taskPageViewController = TaskPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.navigationController?.pushViewController(taskPageViewController, animated: true)
    }
}
