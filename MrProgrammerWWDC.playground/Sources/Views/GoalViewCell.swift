import UIKit

public class GoalViewCell: UICollectionViewCell {
    public static var reuseIdentifier = "cell"
    
    public weak var symbolImageView: UIImageView!
//    public weak var backgroundImageView: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        let symbolIV = UIImageView(frame: .zero)
        symbolIV.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(symbolIV)
        
        symbolIV.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        symbolIV.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        symbolIV.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        symbolIV.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        
        
        
        self.symbolImageView = symbolIV
    }
}

