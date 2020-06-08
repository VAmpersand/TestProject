import UIKit

public final class CountryCodeController: BaseController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()

    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    public var viewModel: CountryCodeViewModelProtocol!
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
        label.textAlignment = .center
        label.text = Texts.CountryCode.titleLable
        
        return label
    }()
    
    private lazy var searchField = SearchField()
    
    private lazy var countryTableView: UITableView = {
        let table = UITableView()
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

        view.backgroundColor = .white
    }

    override func addSubviews() {
        super.addSubviews()
        [
            titleLabel,
            searchField,
            countryTableView,
            letterCollectionView,
        ].forEach { view.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
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
            make.height.equalTo(Constants.cgFloat.p300.rawValue)

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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableCell.cellID,
                                                 for: indexPath) as! CountryTableCell
        
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CountryCodeController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cgFloat.p40.rawValue
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.cgFloat.p50.rawValue
    }
}

// MARK: - CountryCodeControllerProtocol
extension CountryCodeController: CountryCodeControllerProtocol {
    
}
