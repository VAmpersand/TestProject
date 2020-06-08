import UIKit

public class CountryTableHeader: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static let cellID = String(describing: CountryTableHeader.self)

    public lazy var titleLabel: UILabel = {
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

extension CountryTableHeader {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        selectionStyle = .none
    }
    
    func addSubviews() {
    [
        titleLabel,
        separatorView,
    ].forEach { addSubview($0) }
    }
    
    func constraintSubviews() {        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.cgFloat.p5.rawValue)
            make.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.cgFloat.p5.rawValue)
            make.right.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p0_5.rawValue)
        }
    }
}
