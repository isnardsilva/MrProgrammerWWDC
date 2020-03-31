import UIKit

public class GoalView: UIView {
    // MARK: - Properties
    public weak var titleLabel: UILabel!
    public weak var messageLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = Colors.backgroundColor
        
        // Setup Title
        let titleLbl = UILabel()
        self.addSubview(titleLbl)
        
        titleLbl.text = "Temos um cliente"
        titleLbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLbl.textColor = Colors.customBlue
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -90)
        ])
        
        self.titleLabel = titleLbl
        
        
        // Setup Message
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
}
