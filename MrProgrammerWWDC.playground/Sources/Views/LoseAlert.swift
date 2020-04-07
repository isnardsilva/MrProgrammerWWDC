import UIKit

public class LoseAlert: UIViewController {
    // MARK: - Properties
    private weak var contentView: UIView!
    public weak var titleLabel: UILabel!
    public weak var messageLabel: UILabel!
    public weak var closeButton: UIButton!
    
    private var titleText: String!
    private var messageText: String!
    
    
    init(title: String, message: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.view = UIView()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        self.titleText = title
        self.messageText = message
        
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        self.setupContentView()
        self.setupTitleLabel()
        self.setupMessageLabel()
        self.setupCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupContentView() {
        let myContentView = UIView()
        self.view.addSubview(myContentView)
        
        myContentView.backgroundColor = Colors.customGray
        myContentView.layer.cornerRadius = 10
        
        myContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myContentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myContentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            myContentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35)
        ])
        
        self.contentView = myContentView
    }
    
    private func setupTitleLabel() {
        let titleLbl = UILabel()
        self.contentView.addSubview(titleLbl)
        
        titleLbl.text = self.titleText
        titleLbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLbl.textColor = Colors.customBlue
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            titleLbl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
        
        self.titleLabel = titleLbl
    }
    
    private func setupCloseButton() {
        let button = UIButton()
        self.contentView.addSubview(button)
        
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        
        button.setBackgroundImage(UIImage(named: "ButtonNormal"), for: .normal)
        button.setBackgroundImage(UIImage(named: "ButtonPressed"), for: .highlighted)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15)
        ])
        
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        self.closeButton = button
    }
    
    private func setupMessageLabel() {
        let messageLbl = UILabel()
        self.contentView.addSubview(messageLbl)
        
        messageLbl.text = self.messageText
        messageLbl.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        messageLbl.textColor = .white
        messageLbl.textAlignment = .center
        messageLbl.numberOfLines = 0
        
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLbl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            messageLbl.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40),
            messageLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            messageLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
        
        self.messageLabel = messageLbl
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
