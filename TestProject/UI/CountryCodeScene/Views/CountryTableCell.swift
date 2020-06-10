import UIKit

public class CountryTableCell: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static let cellID = String(describing: CountryTableCell.self)
    
    public lazy var flagView: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(17)
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    public lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var separatorView = BaseSeparatorView()
}

extension CountryTableCell {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        selectionStyle = .none
    }
    
    func addSubviews() {
    [
        flagView,
        countryLabel,
        codeLabel,
        separatorView,
    ].forEach { addSubview($0) }
    }
    
    func constraintSubviews() {
        flagView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.cgFloat.p5.rawValue)
            make.top.bottom.equalToSuperview().inset(Constants.cgFloat.p10.rawValue)
            
            make.width.height.equalTo(Constants.cgFloat.p25.rawValue)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.left.equalTo(flagView.snp.right).offset(Constants.cgFloat.p10.rawValue)
            make.centerY.equalToSuperview()
        }
        
        codeLabel.snp.makeConstraints { make in
            make.left.equalTo(countryLabel.snp.right).offset(Constants.cgFloat.p5.rawValue)
            make.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.equalTo(countryLabel)
            make.right.bottom.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p1.rawValue)
        }
    }
}
