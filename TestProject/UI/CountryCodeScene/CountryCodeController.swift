import UIKit

public final class CountryCodeController: BaseController {
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    public var viewModel: CountryCodeViewModelProtocol!
    private var filteredData: [CountryDate]!
    
    private lazy var topLineView = TopLineView()
    private lazy var mainContainerView = MainContainerView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.text = Texts.CountryCode.titleLable
        
        return label
    }()
    
    private lazy var searchField: SearchBar = {
        let searchBar = SearchBar()
        searchBar.searchBar.delegate = self
        
        return searchBar
    }()
    
    private lazy var countryTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        table.register(CountryTableCell.self,
                       forCellReuseIdentifier: CountryTableCell.cellID)
        
        table.separatorStyle = .none
        
        return table
    }()
    
    private lazy var letterCollectionView = LettersCollectionView()
}

extension CountryCodeController {
    override func setupSelf() {
        super.setupSelf()
        addGesture() 
        letterCollectionView.delegate = self
        filteredData = countriesData
        
        view.backgroundColor = .clear
    }

    override func addSubviews() {
        super.addSubviews()
        view.addSubview(mainContainerView)
        view.addSubview(topLineView)
        [
            titleLabel,
            searchField,
            countryTableView,
            letterCollectionView,
        ].forEach { mainContainerView.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.cgFloat.p8.rawValue)
            make.left.right.bottom.equalToSuperview()
        }
        
        topLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainContainerView).offset(-Constants.cgFloat.p8.rawValue)
            make.height.equalTo(Constants.cgFloat.p5.rawValue)
            make.width.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(Constants.cgFloat.p30.rawValue)
        }
        
        searchField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.cgFloat.p30.rawValue)
            make.height.equalTo(Constants.cgFloat.p50.rawValue)
        }
        
        
        countryTableView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.right.equalTo(letterCollectionView.snp.left).offset(-Constants.cgFloat.p10.rawValue)
            make.top.equalTo(searchField.snp.bottom).offset(Constants.cgFloat.p10.rawValue)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        letterCollectionView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(Constants.cgFloat.p10.rawValue)
            make.left.equalTo(countryTableView.snp.right).offset(Constants.cgFloat.p10.rawValue)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p440.rawValue)

        }
    }
}

// MARK: - Action
private extension CountryCodeController {

}

// MARK: - UITableViewDataSource
extension CountryCodeController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 26 + 1
    }
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return filteredData.count
    }
    
  
}

// MARK: - UITableViewDelegate
extension CountryCodeController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cgFloat.p50.rawValue
    }
    
    public func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.cgFloat.p60.rawValue
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableCell.cellID,
                                                 for: indexPath) as! CountryTableCell
        
        if indexPath.section == 0 {
            cell.flagView.text = countriesData[0].flag
            cell.countryLabel.text = countriesData[0].name
            cell.codeLabel.text = "(" + countriesData[0].code + ")"
        } else {
            cell.flagView.text = filteredData[indexPath.row].flag
            cell.countryLabel.text = filteredData[indexPath.row].name
            cell.codeLabel.text = "(" + filteredData[indexPath.row].code + ")"
        }
        
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView? {
        let header = CountryTableHeader()
        header.backgroundColor = .white
        
        if section == 0 {
            header.titleLabel.text = Texts.CountryCode.saggestionsLabel
        } else {
            header.titleLabel.text = Texts.CountryCode.letterValue[section - 1]
        }
        
        return header
        
    }
}

// MARK: - LettersCollectionDelegate
extension CountryCodeController: LettersCollectionDelegate {
    public func selectedLetter(at index: Int) {
        countryTableView.scrollToRow(at: IndexPath(row: 0, section: index + 1),
                                     at: .top,
                                     animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension CountryCodeController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let first = searchText.first, "+1234567890".contains(first) {
            filteredData = searchText.isEmpty ? countriesData : countriesData.filter() {
                ($0.code.lowercased() as String).contains(searchText.lowercased())
            }
        } else {
            filteredData = searchText.isEmpty ? countriesData : countriesData.filter() {
                ($0.name.lowercased() as String).contains(searchText.lowercased())
            }
        }
        countryTableView.reloadData()
    }
}

extension CountryCodeController {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}

// MARK: - CountryCodeControllerProtocol
extension CountryCodeController: CountryCodeControllerProtocol {
    
}
