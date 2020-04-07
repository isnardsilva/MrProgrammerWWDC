import UIKit

public class TutorialAlert: UIView {
    // MARK: - Properties
    private weak var titleLabel: UILabel!
    private weak var messageLabel: UILabel!
    public weak var closedButton: UIButton!
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.frame.size = CGSize(width: 250, height: 150)
        self.backgroundColor = Colors.customGray
        self.layer.cornerRadius = 10
        self.isHidden = true
        
        
        self.setupTitleLabel()
        self.setupMessageLabel()
        self.setupClosedButton()
    }
    
    private func setupTitleLabel() {
        // Setup Title
        let titleLbl = UILabel()
        self.addSubview(titleLbl)
        
        titleLbl.text = "Title text"
        titleLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLbl.textColor = Colors.customBlue
        titleLbl.textAlignment = .center
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        self.titleLabel = titleLbl
    }
    
    private func setupMessageLabel() {
        // Setup Message
        let messageLbl = UILabel()
        self.addSubview(messageLbl)

        messageLbl.text = "Message Text"
        
        messageLbl.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        messageLbl.textColor = .white
        messageLbl.textAlignment = .center
        messageLbl.numberOfLines = 0

        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLbl.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            messageLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            messageLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])

        self.messageLabel = messageLbl
    }
    
    private func setupClosedButton() {
        let button = UIButton()
        self.addSubview(button)
        
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        button.isUserInteractionEnabled = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            button.widthAnchor.constraint(equalTo: button.heightAnchor)
        ])
        
        self.closedButton = button
    }
    
    public func show(title: String, message: String, cellFrameInSuperview: CGRect) {
        self.isHidden = false
        
        // Verificando se o Alert ja foi adicionado a alguma view
        guard let _ = superview else {
            return
        }
        
        // Definindo as informacoes que serao exibidas
        self.titleLabel.text = title
        self.messageLabel.text = message
        
        // Definindo a posicao Y
        self.frame.origin.y = (cellFrameInSuperview.origin.y - self.frame.size.height) - 10
        
        
        // Verificando se pode ser colocado no centro da celula
        if self.canPutInTheCenter(cellFrameInSuperview: cellFrameInSuperview) {
//            print("Tem espaco no centro")
            self.frame.origin.x = cellFrameInSuperview.midX - (self.frame.width / 2)
            return
        }
        
        
        // Verificando se pode colocar a direita da celula
        if self.canPutOnTheRight(cellFrameInSuperview: cellFrameInSuperview) {
//            print("Tem espaco a direita")
            self.frame.origin.x = cellFrameInSuperview.origin.x
            return
        }
        
        
        // Verificando se pode colocar a esquerda da celula
        if self.canPutOnTheLeft(cellFrameInSuperview: cellFrameInSuperview) {
//            print("Tem espaco a esquerda")
            self.frame.origin.x = cellFrameInSuperview.maxX - self.frame.size.width
//            self.frame.origin.y = cellFrameInSuperview.origin.y - self.frame.size.height
            return
        }
        
    }
    
    
    private func canPutInTheCenter(cellFrameInSuperview: CGRect) -> Bool {
        let widthSuperview = superview!.frame.size.width
        let availableWidthOnTheLeft = cellFrameInSuperview.midX
        let availableWidthOnTheRight = widthSuperview - cellFrameInSuperview.midX
        let halfWidthAlert = self.frame.size.width / 2
        
        return (availableWidthOnTheLeft > halfWidthAlert) && (availableWidthOnTheRight > halfWidthAlert)
    }
    
    private func canPutOnTheRight(cellFrameInSuperview: CGRect) -> Bool {
        let widthSuperview = superview!.frame.size.width
        let availableWidthOnTheRight = widthSuperview - cellFrameInSuperview.origin.x
        
        return availableWidthOnTheRight > self.frame.size.width
    }
    
    private func canPutOnTheLeft(cellFrameInSuperview: CGRect) -> Bool {
        return cellFrameInSuperview.origin.x > self.frame.size.width
    }
    
    
    
    public func hide() {
        self.isHidden = true
    }
}
