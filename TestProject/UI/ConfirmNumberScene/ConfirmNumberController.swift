import UIKit

public final class ConfirmNumberController: BaseController {
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewDidLoad()
        codeField_0.phoneNumberField.becomeFirstResponder()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    public var viewModel: ConfirmNumberViewModelProtocol!
    
    private var codeValue: [Int?] = [nil, nil, nil, nil]

    private lazy var topLineView = TopLineView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.text = Texts.ConfirmNumber.titleLable
        
        return label
    }()
    
    private lazy var descreiptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var codeField_0 = CodeField()
    private lazy var codeField_1 = CodeField()
    private lazy var codeField_2 = CodeField()
    private lazy var codeField_3 = CodeField()
    
    private lazy var codeFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        [
            codeField_0,
            codeField_1,
            codeField_2,
            codeField_3,
        ].forEach { stackView.addArrangedSubview($0) }
        
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    private lazy var didNotGetLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.ConfirmNumber.didNotGetLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var sendAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.ConfirmNumber.sendButton,
                        for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.mintColor,
                             for: .normal)
        button.titleLabel?.textAlignment = .left
        button.addTarget(self,
                         action: #selector(sandAgainButtonHendler),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sandAgainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.axis = .horizontal
        [
            didNotGetLabel,
            sendAgainButton
            ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
}

extension ConfirmNumberController {
    override func setupSelf() {
        super.setupSelf()
        
        codeField_0.delegate = self
        codeField_1.delegate = self
        codeField_2.delegate = self
        codeField_3.delegate = self
        addObservers()
    }

    override func addSubviews() {
        super.addSubviews()
        view.addSubview(topLineView)
        view.addSubview(containerView)
        [
            titleLabel,
            descreiptionLabel,
            codeFieldsStackView,
            sandAgainStackView,
        ].forEach { containerView.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(-Constants.cgFloat.p30.rawValue)
            make.height.equalTo(Constants.cgFloat.p340.rawValue)
        }
        
        topLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(containerView).offset(-Constants.cgFloat.p8.rawValue)
            make.height.equalTo(Constants.cgFloat.p5.rawValue)
            make.width.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalToSuperview().inset(Constants.cgFloat.p25.rawValue)
        }
        
        descreiptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p25.rawValue)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.cgFloat.p15.rawValue)
        }
        
        codeFieldsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.cgFloat.p230.rawValue)
            make.height.equalTo(Constants.cgFloat.p50.rawValue)
            make.bottom.equalTo(sandAgainStackView.snp.top).offset(-Constants.cgFloat.p40.rawValue)
        }
        
        sandAgainStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.cgFloat.p60.rawValue)
            make.height.equalTo(20)
        }
    }
}

// MARK: - Action
private extension ConfirmNumberController {
    @objc func sandAgainButtonHendler() {
        viewModel.handleClose()
    }
}

private extension ConfirmNumberController {
    private func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let topOffset = view.frame.height - 270
        
        topLineView.frame.origin.y = topOffset - 15 - keyboardFrame.cgRectValue.height
        containerView.frame.origin.y = topOffset - keyboardFrame.cgRectValue.height
        
        containerView.snp.remakeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(
                Constants.cgFloat.p30.rawValue - keyboardFrame.cgRectValue.height
            )
            make.height.equalTo(Constants.cgFloat.p300.rawValue)
        }
        
        [
            codeField_0,
            codeField_1,
            codeField_2,
            codeField_3,
        ].forEach {
            if $0.phoneNumberField.isFirstResponder {
                $0.firstResponder = true
            } else {
                $0.firstResponder = false
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        let userInfo = notification.userInfo
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        topLineView.frame.origin.y += keyboardFrame.cgRectValue.height
        containerView.frame.origin.y += keyboardFrame.cgRectValue.height
        
        containerView.snp.remakeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(Constants.cgFloat.p30.rawValue)
            make.height.equalTo(Constants.cgFloat.p300.rawValue)
        }
    }
}

// MARK: - CodeFieldDelegate
extension ConfirmNumberController: CodeFieldDelegate {
    public func numberEntered(number: Int) {
        if codeField_0.phoneNumberField.isFirstResponder {
            codeValue[0] = number
            codeField_1.phoneNumberField.becomeFirstResponder()
        } else if codeField_1.phoneNumberField.isFirstResponder {
            codeValue[1] = number
            codeField_2.phoneNumberField.becomeFirstResponder()
        } else if codeField_2.phoneNumberField.isFirstResponder {
            codeValue[2] = number
            codeField_3.phoneNumberField.becomeFirstResponder()
        } else if codeField_3.phoneNumberField.isFirstResponder {
            codeValue[3] = number
        }

        if !codeValue.contains(nil) {
            viewModel.handleClose()
        }
    }
}


// MARK: - ConfirmNumberControllerProtocol
extension ConfirmNumberController: ConfirmNumberControllerProtocol {
    public func setupPhone(phone: String) {
        descreiptionLabel.text = [Texts.ConfirmNumber.descriptionLabel,
                                  phone].joined(separator: "\n")
    }
}



