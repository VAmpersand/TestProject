import UIKit

public final class MainScreenController: BaseController {
    public var viewModel: MainScreenViewModelProtocol!
    
    private var signInPressed = false
    private var phoneLoginSelected = true
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        return scrollView
    }()

    private lazy var contentView = UIView()
    private lazy var topLineView = TopLineView()
    private lazy var mainContainerView = MainContainerView()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = [
            Texts.MainScene.sightLabel,
            Texts.MainScene.gideDataLabel,
        ].joined(separator: ":\n")
        
        return label
    }()
    
    private lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.textColor = Colors.mintColor
        label.text = Texts.MainScene.greetingsLable
        
        return label
    }()
    
    private lazy var descreiptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Texts.MainScene.descriptionLabel
        
        return label
    }()
    
    private lazy var phoneNumberView: PhoneNumberView = {
        let view = PhoneNumberView()
        view.countryCodeButton.addTarget(self,
                                         action: #selector(presentCountryCodeScene), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var confirmButton: BaseMainButton = {
           let button = BaseMainButton()
           button.setTitle(Texts.MainScene.confirmButtonLable,
                           for: .normal)
           button.addTouchUpInsideTarget(self,
                                         action: #selector(confirmButtonHandler))
           
           return button
    }()
    
    
    private lazy var notYouLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.MainScene.notYouLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right

        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.MainScene.signInLabel,
                        for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.mintColor,
                             for: .normal)
        button.titleLabel?.textAlignment = .left
        button.addTarget(self,
                         action: #selector(signInButtonHandler),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.axis = .horizontal
        [
            notYouLabel,
            signInButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    public lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.attributedPlaceholder = NSAttributedString(
            string: Texts.MainScene.emailPlaceholder,
            attributes: [.font: UIFont.systemFont(ofSize: 22)]
        )
        textField.keyboardAppearance = .dark
        
        return textField
    }()
    
    private lazy var separatorView = BaseSeparatorView()
    
    private lazy var loginOptionsContainerView = LoginOptionsContainerView()
}

extension MainScreenController {
    override func setupSelf() {
        super.setupSelf()
        addSubviews()
        constraintSubviews()
        addGesture()
        addObservers()
        updateLoginViews()
        updateInputViews()
        setupUserData(for: User())
        loginOptionsContainerView.delegate = self
    }

    override func addSubviews() {
        super.addSubviews()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topLineView)
        contentView.addSubview(mainContainerView)
        [
            imageView,
            titleLabel,
            greetingsLabel,
            descreiptionLabel,
            phoneNumberView,
            confirmButton,
            phoneNumberView,
            confirmButton,
            emailField,
            separatorView,
            signInStackView,
            loginOptionsContainerView,
        ].forEach { mainContainerView.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.top.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
        }

        mainContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.cgFloat.p8.rawValue)
            make.bottom.left.right.equalToSuperview()
        }
        
        topLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainContainerView).offset(-Constants.cgFloat.p8.rawValue)
            make.height.equalTo(Constants.cgFloat.p5.rawValue)
            make.width.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.cgFloat.p30.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.55)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(Constants.cgFloat.p30.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
        }
        
        greetingsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.cgFloat.p30.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
        }
        
        descreiptionLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingsLabel.snp.bottom).offset(Constants.cgFloat.p15.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p25.rawValue)
        }
        
        phoneNumberView.snp.makeConstraints { make in
            make.top.equalTo(descreiptionLabel.snp.bottom).offset(Constants.cgFloat.p80.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberView.snp.bottom).offset(Constants.cgFloat.p80.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p50.rawValue)
        }
                
        signInStackView.snp.makeConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(Constants.cgFloat.p25.rawValue)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p20.rawValue)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(descreiptionLabel.snp.bottom).offset(Constants.cgFloat.p80.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(Constants.cgFloat.p5.rawValue)
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p1.rawValue)
        }
        
        loginOptionsContainerView.snp.makeConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(Constants.cgFloat.p25.rawValue)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainContainerView.snp.bottom).inset(Constants.cgFloat.p30.rawValue)
        }
    }
}

// MARK: - Action
private extension MainScreenController {
    @objc func confirmButtonHandler() {
        guard let phoneBody = phoneNumberView.phoneNumberField.text,
            let code = phoneNumberView.codeLabel.text else { return }
        
        viewModel.presentConfirmNumberScene(with: code + phoneBody)
    }
    
    @objc func presentCountryCodeScene() {
        viewModel.presentCountryCodeScene()
    }
    
    @objc func signInButtonHandler() {
        signInPressed.toggle()
        updateLoginViews()
    }
}

private extension MainScreenController {
    func updateLoginViews() {
        loginOptionsContainerView.isHidden = !signInPressed
        signInStackView.isHidden = signInPressed
        
        if signInPressed {
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = CGPoint(x: 0,
                                                        y: Constants.cgFloat.p250.rawValue)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = CGPoint(x: 0,
                                                        y: -Constants.cgFloat.p40.rawValue)
            }
        }
    }
    
    func updateInputViews() {
        emailField.isHidden = phoneLoginSelected
        separatorView.isHidden = phoneLoginSelected
        phoneNumberView.isHidden = !phoneLoginSelected
    }
}

private extension MainScreenController {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}

private extension MainScreenController {
    func addObservers() {
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
        let keyboardFrameHeight = keyboardFrame.cgRectValue.height
        
        if phoneNumberView.phoneNumberField.isFirstResponder
            && emailField.isFirstResponder {
            scrollView.contentOffset  = CGPoint(x: 0,
                                                y: keyboardFrameHeight)
        }
    }
    
    @objc func keyboardWillHide() {
        if phoneNumberView.phoneNumberField.isFirstResponder
            && emailField.isFirstResponder {
            scrollView.contentOffset = CGPoint(x: 0,
                                               y: -Constants.cgFloat.p40.rawValue)
            
        }
    }
}

// MARK: - LoginOptionsContainerDelegate
extension MainScreenController: LoginOptionsContainerDelegate {
    public func selected(option: LoginOptions) {
        phoneLoginSelected = option == .phone ? true : false
        updateInputViews()
        signInPressed = false
        updateLoginViews()
    }
}

// MARK: - TeamShiftsControllerProtocol
extension MainScreenController: MainScreenControllerProtocol {
    public func setupUserData(for user: User) {
        greetingsLabel.text = [Texts.MainScene.greetingsLable,
                               user.name].joined(separator: " ") + "!"
        phoneNumberView.codeLabel.text = user.code
        phoneNumberView.phoneNumberField.text = user.phone
        let curentData = countriesData.first { data -> Bool in
            data.code == user.code
        }
        phoneNumberView.flagView.text = curentData?.flag
    }
}


