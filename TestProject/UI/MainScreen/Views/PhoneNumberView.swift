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
    
    public lazy var flagView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textAlignment = .right

        return label
    }()
    
    public lazy var phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.attributedPlaceholder = NSAttributedString(
            string: Texts.MainScene.phoneNumberPlaceholder,
            attributes: [.font: UIFont.systemFont(ofSize: 22)]
        )
        textField.keyboardType = .phonePad
        textField.keyboardAppearance = .dark
        textField.delegate = self
        
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
            make.width.equalTo(Constants.cgFloat.p65.rawValue)
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
            make.width.equalTo(Constants.cgFloat.p25.rawValue)
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

extension PhoneNumberView: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        guard let currentText = textField.text as NSString? else { return false }
        let changedString = string.replacingOccurrences(of: " ", with: "")
        let newText = currentText.replacingCharacters(in: range, with: changedString)
        
        if newText.count > 15 {
            return false
        }

        if CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: newText)) {
            textField.text = newText
        }

        return false
    }
}
