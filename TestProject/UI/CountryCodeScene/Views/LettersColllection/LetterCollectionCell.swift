import UIKit

public class LetterCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static let cellID = String(describing: LetterCollectionCell.self)

    public lazy var letterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(13)
        
        return label
    }()
}


private extension LetterCollectionCell {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        addSubview(letterLabel)
    }
    
    func constraintSubviews() {
        letterLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

