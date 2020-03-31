import UIKit

public class GoalViewController: UIViewController {
    // MARK: - Properties
    public var goalView: GoalView {
        return (view as! GoalView)
    }
    
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
        view = GoalView()
    }
}
