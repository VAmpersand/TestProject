import UIKit

public final class CodeField: UIView {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: CodeFieldDelegate?
    
    public var firstResponder: Bool = false {
        didSet {
            layer.borderColor = firstResponder ? UIColor.black.cgColor : UIColor.clear.cgColor
        }
    }
    
    public lazy var phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.delegate = self
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.keyboardType = .decimalPad
        textField.keyboardAppearance = .dark
        textField.tintColor = .clear
        
        return textField
    }()
}

private extension CodeField {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        backgroundColor = .white

        applyFirstShadow()
    }
    
    func addSubviews() {
        addSubview(phoneNumberField)
    }
    
    func constraintSubviews() {
        phoneNumberField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.cgFloat.p1.rawValue)
        }
    }
}

extension CodeField: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        guard let currentText = textField.text as NSString? else { return false }
        let changedString = string.replacingOccurrences(of: " ", with: "")
        let newText = currentText.replacingCharacters(in: range, with: changedString)
        
        if newText.count > 1 {
            return false
        }

        if CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: newText)) {
            textField.text = newText
            if let number = Int(newText) {
                delegate?.numberEntered(number: number)
            }
        }

        return false
    }
}

