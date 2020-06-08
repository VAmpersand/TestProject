import UIKit

public final class SearchField: UIView {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.placeholder = Texts.CountryCode.searchLabel
        
        return textField
    }()
    
    public lazy var searchLenceView: UIImageView = {
        let view = UIImageView()
        view.image = Icons.CountryCode.searchLens
        
        return view
    }()
}

private extension SearchField {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        backgroundColor = .white
        layer.cornerRadius = 5
        applyFirstShadow()
    }
    
    func addSubviews() {
        [
            searchField,
            searchLenceView,
        ].forEach { addSubview($0) }
    }
    
    func constraintSubviews() {
        searchLenceView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.Offsets.p10.rawValue)
            make.centerY.equalTo(searchField)
            make.width.height.equalTo(Constants.Size.p20.rawValue)
        }
        
        searchField.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(searchLenceView.snp.right).offset(Constants.Offsets.p5.rawValue)
        }
    }
}

