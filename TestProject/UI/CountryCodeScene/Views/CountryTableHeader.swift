import UIKit

public class CountryTableHeader: UITableViewHeaderFooterView {
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var separatorView = BaseSeparatorView()
}

extension CountryTableHeader {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        addSubview(containerView)
    [
        titleLabel,
        separatorView,
        ].forEach { containerView.addSubview($0) }
    }
    
    func constraintSubviews() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().inset(Constants.cgFloat.p5.rawValue)
        }
        
        separatorView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p1.rawValue)
        }
    }
}
