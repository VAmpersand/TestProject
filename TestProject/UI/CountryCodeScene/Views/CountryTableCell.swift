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
    
    public lazy var flagView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    public lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    public lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        return view
    }()
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
            make.left.equalToSuperview().inset(Constants.Offsets.p5.rawValue)
            make.top.bottom.equalToSuperview().inset(Constants.Offsets.p10.rawValue)
            make.width.equalTo(flagView.snp.height)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.left.equalTo(flagView.snp.right).offset(Constants.Offsets.p10.rawValue)
            make.centerY.equalToSuperview()
        }
        
        countryLabel.snp.makeConstraints { make in
            make.left.equalTo(countryLabel.snp.right).offset(Constants.Offsets.p5.rawValue)
            make.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.equalTo(countryLabel.snp.right).offset(Constants.Offsets.p5.rawValue)
            make.right.equalToSuperview()
            make.height.equalTo(Constants.Size.p1.rawValue)
        }
    }
}
