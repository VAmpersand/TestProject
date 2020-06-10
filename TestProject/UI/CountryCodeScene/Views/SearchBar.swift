import UIKit

public final class SearchBar: UIView {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Texts.CountryCode.searchLabel
        searchBar.layer.cornerRadius = 10
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 15)
        searchBar.clipsToBounds = true
        searchBar.keyboardAppearance = .dark
        
        return searchBar
    }()
}

private extension SearchBar {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        layer.cornerRadius = 10
        applyFirstShadow()
    }
    
    func addSubviews() {
        addSubview(searchBar) 
    }
    
    func constraintSubviews() {
        searchBar.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.cgFloat.p1.rawValue)
        }
    }
}

