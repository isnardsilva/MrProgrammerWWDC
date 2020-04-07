import UIKit

public class StartView: UIView {
    // MARK: - Properties
    public weak var startButton: UIButton!
    public weak var titleLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = Colors.backgroundColor
        
        setupBackgroundImage()
        setupTitleLabel()
        setupStartButton()
        
    }
    
    private func setupBackgroundImage() {
        let imageView = UIImageView()
        self.addSubview(imageView)
        
        imageView.image = UIImage(named: "SymbolsBackground")
        imageView.alpha = 0.05
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        self.addSubview(label)
        
        label.text = "Bem-vindo, \n Mr. Programmer"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -75)
        ])
        
        self.titleLabel = label
    }
    
    
    private func setupStartButton() {
        let button = UIButton()
        self.addSubview(button)
        
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        
        button.setBackgroundImage(UIImage(named: "ButtonNormal"), for: .normal)
        button.setBackgroundImage(UIImage(named: "ButtonPressed"), for: .highlighted)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 75)
        ])
        
        self.startButton = button
    }
    
}
