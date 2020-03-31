import UIKit

public class MessageViewController: UIViewController {
    // MARK: - Properties
    private var titleMessage: String
    private var textMessage: String
    
    public var messageView: MessageView {
        return (view as! MessageView)
    }
    
    
    init(titleMessage: String, textMessage: String) {
        self.titleMessage = titleMessage
        self.textMessage = textMessage

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Lifecycle
    public override func loadView() {
        super.loadView()
        
//        messageView = MessageView()
        self.view = MessageView()
        
        // Add textos que serao exibidos na tela
        messageView.titleLabel.text = titleMessage
        messageView.messageLabel.text = textMessage
    }
}
