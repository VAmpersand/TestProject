import UIKit

public final class PhoneNumberView: UIView {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.applyFirstShadow()
        
        return view
    }()
    
    public lazy var countryCodeButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var triangleView: UIImageView = {
        let view = UIImageView()
        view.image = Icons.MainScene.triangleDown
        
        return view
    }()
    
    public lazy var flagView = UIView()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 26)
        label.textAlignment = .right
        label.text = "+7"
        
        return label
    }()
    
    public lazy var phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 26)
        textField.placeholder = Texts.MainScene.phoneNumberPlaceholder
        
        return textField
    }()
    
    private lazy var separatorView = BaseSeparatorView()
}

private extension PhoneNumberView {
    func setupSelf() {
        addSubviews()
        constraintSubviews()

    }
    
    func addSubviews() {
        [
            countryCodeButton,
            triangleView,
            flagView,
        ].forEach { containerView.addSubview($0) }
        [
            containerView,
            codeLabel,
            phoneNumberField,
            separatorView,
        ].forEach { addSubview($0) }
    }

    func constraintSubviews() {
        containerView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(Constants.cgFloat.p60.rawValue)
        }
        
        countryCodeButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        triangleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(Constants.cgFloat.p10.rawValue)
            make.width.equalTo(Constants.cgFloat.p10.rawValue)
        }
        
        flagView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(Constants.cgFloat.p10.rawValue)
            make.width.equalTo(Constants.cgFloat.p20.rawValue)
        }
        
        codeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(countryCodeButton.snp.right).offset(Constants.cgFloat.p10.rawValue)
            make.width.equalTo(Constants.cgFloat.p30.rawValue)
        }
        
        phoneNumberField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(codeLabel.snp.right).offset(Constants.cgFloat.p15.rawValue)
            make.right.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(codeLabel).offset(Constants.cgFloat.p5.rawValue)
            make.left.equalTo(codeLabel)
            make.right.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p1.rawValue)
        }
    }
}

