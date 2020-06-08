import UIKit

public final class LettersCollectionView: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellID = "CellID"
    
    public lazy var letterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 1)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(LetterCollectionCell.self,
                                forCellWithReuseIdentifier: LetterCollectionCell.cellID)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
}


private extension LettersCollectionView {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        addSubview(letterCollectionView)
    }
    
    func constraintSubviews() {
        letterCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: - UICollectionViewDataSource
extension LettersCollectionView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Texts.CountryCode.letterValue.length
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionCell.cellID,
                                                      for: indexPath) as! LetterCollectionCell
    
        cell.letterLabel.text = Texts.CountryCode.letterValue[indexPath.row]

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension LettersCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.width)
    }
}
